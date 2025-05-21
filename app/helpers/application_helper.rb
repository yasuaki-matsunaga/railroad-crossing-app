module ApplicationHelper
  def page_title(title = '')
    base_title = 'フミキリのちず'
    title.present? ? "#{title} | #{base_title}" : base_title
  end

  def privacy_policy
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(Rails.root.join('privacy_policy.md').read)
  end

  def service_terms
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(Rails.root.join('service_terms.md').read)
  end

  def default_meta_tags
    base_title = 'フミキリのちず'
    page_title = content_for?(:title) ? "#{content_for(:title)} | #{base_title}" : base_title
    {
      site: base_title,
      title: page_title,
      reverse: true,
      charset: 'utf-8',
      description: '踏切の位置情報の検索と踏切の写真投稿ができるWEBサイト',
      keywords: '踏切,電車,地図',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: '踏切の位置検索と写真投稿',
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('仮ogp.jpg'),
        local: 'ja-JP'
      }
    }
  end
end
