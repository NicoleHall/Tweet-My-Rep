require 'test_helper'

class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest

  test "user can see list of reps and is then asked to log in" do
    skip
    visit "/"
    assert_equal 200, page.status_code
    fill_in("Search your zipcode", :with => '80205')

    stub_sunlight_request

    click_button "Search"
    assert_equal "/search", current_path

    assert page.has_content?("The legislators who represent you are: ")
    click_link "Sign in with Twitter"


    stub_request(:get, "http://api.nytimes.com/svc/search/v2/articlesearch.json?api-key=&q=jan%20k")
    . with(:headers => {'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Ruby'})
        . to_return(:status => 200, :body => { "response" => {"docs" =>
          [{ 'web_url'=> 'www.pizza.com', 'snippet' => 'pizza taste good' }]
          }}.to_json, :headers => {'Content-Type' => 'application/json'})

    assert page.has_content?("ColeMersich")
    assert page.has_link?("Logout")

  end

  test "logging out" do
    VCR.use_cassette('logging_out#destroy') do
      visit "/"
      fill_in("Search your zipcode", with: "80205")
      click_button("Search")
      assert_equal search_path, current_path
      assert page.has_button?("Sign in with Twitter")
      click_button "Sign in with Twitter"
      assert User.find_by_name("ColeMersich")
      click_link "Logout"
      refute page.has_content?("ColeMersich")
    end
  end

  def stub_sunlight_request
    stub_request(:get, "https://congress.api.sunlightfoundation.com/legislators/locate?apikey=&zip=80205").
      with(
      :headers => {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Ruby'}).
        to_return(:status => 200,
        :body => { "results" => [
          { 'first_name' => 'jan',
            'last_name' => 'k',
            'twitter_id' => 'jank'}] }.
            to_json,
            :headers =>
            {'Content-Type' => 'application/json'}
            )
  end

end
