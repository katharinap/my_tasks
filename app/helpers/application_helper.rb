# frozen_string_literal: true

module ApplicationHelper
  def category_tag(category)
    text_class = case category.name
                 when /cvsf/i then 'text-primary'
                 when /blender/i then 'text-warning'
                 when /dfi/i then 'text-success'
                 else
                   'text-info'
                 end
    class_str = "fas fa-#{category.icon} #{text_class} fa-lg"

    content_tag(:i, '', class: class_str, title: category.name)
  end
end
