class Legislator < ActiveRecord::Base

 after_save :add_at_symbol
 validates_uniqueness_of :last_name, scope: :first_name

  # def initialize(twitter_id: nil, first_name: nil, last_name: nil)
  #   @twitter_handle = "@#{twitter_id}"
  #   @first_name = first_name
  #   @last_name = last_name
  # end

  def full_name
    "#{first_name} #{last_name}"
  end

  def ==(other)
    other.is_a?(Legislator) &&
      first_name == other.first_name &&
      last_name == other.last_name &&
      twitter_handle == other.twitter_handle
  end

  def add_at_symbol
    unless twitter_id.starts_with?("@")
      new_twitter_id = "@#{twitter_id}"
      update_attribute(:twitter_id, new_twitter_id)
    end
  end
end
