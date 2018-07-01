# frozen_string_literal: true

module ApplicationHelper
  def category_tag(name)
    text_class = case name
                 when /cvsf/i then 'text-primary'
                 when /blender/i then 'text-danger'
                 when /dfi/i then 'text-success'
                 else
                   'text-info'
                 end
    icon = /support/i.match?(name) ? 'user-tag' : 'code'
    content_tag(:i, '', class: "fas fa-#{icon} #{text_class}", title: name)
  end
end
