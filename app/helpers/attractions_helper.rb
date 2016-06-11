module AttractionsHelper
  def add_new_attraction_tag
    if current_user.admin
      link_to "New Attraction", new_attraction_path
    end
  end

  def index_link_tag(attraction)
    current_user.admin ? admin_link(attraction) : user_link(attraction)
  end

  def admin_link(attraction)
    link_to "Show #{attraction.name}", attraction_path(attraction)
  end

  def user_link(attraction)
    link_to "Go on #{attraction.name}", attraction_path(attraction)
  end
end
