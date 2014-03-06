module ApplicationHelper

  def full_title(title)
    base_title = 'Ruby on Rails Tutorial'

    unless title.empty?
      base_title << " | #{title}"
    end

    base_title
  end
end
