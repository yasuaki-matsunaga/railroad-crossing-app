# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://fumikiri-map.com"
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.sitemaps_host = "https://yasuaki-bucket.s3.amazonaws.com/"
SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new(
  fog_provider:           'AWS',
  aws_access_key_id:      ENV['AWS_ACCESS_KEY_ID'],
  aws_secret_access_key:  ENV['AWS_SECRET_ACCESS_KEY'],
  fog_directory:          ENV['AWS_BUCKET'],
  fog_region:             ENV['AWS_DEFAULT_REGION'],
  fog_public:             false
)

SitemapGenerator::Sitemap.create do
  add '/', priority: 1.0

  Crossing.find_each do |crossing|
    add "/crossings/#{crossing.crossing_id}", priority: 0.5

    crossing.posts.find_each do |post|
      add "/crossings/#{crossing.crossing_id}/posts/#{post.id}", priority: 0.5
    end
  end

  add '/posts', priority: 0.7

  add '/login', priority: 0.5

  add '/pages/how_to_use', priority: 0.3

  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
