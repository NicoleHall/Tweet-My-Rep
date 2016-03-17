require 'test_helper'

class EmailIsDisplayedIfTwitterIsBlankTest < ActionDispatch::IntegrationTest

  test "legislators email is displayed if twitter handle is blank" do
    VCR.use_cassette('legislators#no_twitter') do
    generate_six_random_zipcodes
    ted_lieu = Legislator.create(
      twitter_id: nil,
      first_name: "Ted",
      last_name: "Lieu",
      email: "Rep.Lieu@opencongress.org"
      )

      visit "/"
      click_link("logging_in")
      fill_in("Search your zipcode", :with => '56666')
      click_button("searching")
      
      assert page.has_content?("Collin Peterson does not have a twitter id But you can send an email!")
   end
  end
end
