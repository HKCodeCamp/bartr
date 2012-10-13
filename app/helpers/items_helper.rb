module ItemsHelper
  def has_coord?
    not @coord.nil?
  end

  def distance_from_user(item)
    if @coord
      item.distance_from(@coord)
    else
      nil
    end
  end

  def is_owner?(item)
    item.owner == current_user
  end

  def interest_button_class(item)
    if current_user.is_interested_in?(item)
      "hidden"
    else
      ""
    end
  end

  def uninterest_button_class(item)
    unless current_user.is_interested_in?(item)
      "hidden"
    else
      ""
    end
  end
end
