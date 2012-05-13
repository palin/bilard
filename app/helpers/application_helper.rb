module ApplicationHelper
  def span_tag(text)
    "<span>#{text}</span>".html_safe
  end
end
