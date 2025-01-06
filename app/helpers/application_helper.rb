module ApplicationHelper

  def privacy_policy
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(File.read(Rails.root.join('privacy_policy.md')))
  end
 
  def service_terms
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(File.read(Rails.root.join('service_terms.md')))
  end

end
