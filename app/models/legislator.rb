class Legislator
  attr_reader :twitter_handle, :first_name, :last_name

  def initialize(twitter_id: nil, first_name: nil, last_name: nil)
    @twitter_handle = "@#{twitter_id}"
    @first_name = first_name
    @last_name = last_name
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def ==(other)
    other.is_a?(Legislator) &&
      first_name == other.first_name &&
      last_name == other.last_name &&
      twitter_handle == other.twitter_handle
  end
end
