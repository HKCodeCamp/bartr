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
end
