class Legislator < ActiveRecord::Base

 validates_uniqueness_of :last_name, scope: :first_name

  def full_name
    "#{first_name} #{last_name}"
  end

  def articles
    NytService.new.search_articles(self)
  end

end
