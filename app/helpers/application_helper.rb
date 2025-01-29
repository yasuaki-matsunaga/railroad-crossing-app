module ApplicationHelper
  def privacy_policy
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(Rails.root.join('privacy_policy.md').read)
  end

  def service_terms
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(Rails.root.join('service_terms.md').read)
  end

  def default_meta_tags
    {
      site: 'フミキリのちず',
      title: '踏切の位置検索と写真投稿',
      reverse: true,
      charset: 'utf-8',
      description: '踏切の位置情報の検索と踏切の写真投稿ができるWEBサイト',
      keywords: '踏切,電車,地図',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('仮ogp.jpg'),
        local: 'ja-JP'
      }
    }
  end
end
