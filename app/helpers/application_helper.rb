# frozen_string_literal: true

module ApplicationHelper
  def category_tag(category)
    icon_tag(category.icon, category.icon_color, category.name)
  end

  def icon_tag(icon_name, context_class = 'primary', title = '')
    class_str = "fas fa-#{icon_name} text-#{context_class} fa-lg"
    content_tag(:i, '', class: class_str, title: title)
  end
end
