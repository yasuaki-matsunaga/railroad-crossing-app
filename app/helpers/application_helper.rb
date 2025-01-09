module ApplicationHelper
  def privacy_policy
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(Rails.root.join('privacy_policy.md').read)
  end

  def service_terms
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(Rails.root.join('service_terms.md').read)
  end
end
