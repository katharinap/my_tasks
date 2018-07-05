# frozen_string_literal: true

module ApplicationHelper
  def category_tag(name)
    text_class = case name
                 when /cvsf/i then 'text-primary'
                 when /blender/i then 'text-warning'
                 when /dfi/i then 'text-success'
                 else
                   'text-info'
                 end
    icon = /support/i.match?(name) ? 'user-tag' : 'code'
    class_str = "fas fa-#{icon} #{text_class} fa-lg"

    content_tag(:i, '', class: class_str, title: name)
  end
end
