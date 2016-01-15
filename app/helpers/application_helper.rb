module ApplicationHelper

  def formatted_legislators_in_list
    list = @legislators.map do |legislator|
      f = legislator["first_name"]
      l = legislator["last_name"]
      "#{f} #{l}"
    end
    [list[0...-1].join(", "), list.last].join(", and ")
  end
end
