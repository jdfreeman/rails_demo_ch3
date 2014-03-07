module ApplicationHelper

  def full_title(title)
    base_title = 'Ruby on Rails Tutorial'

    base_title << " | #{title}" unless title.empty?

    base_title
  end
end
