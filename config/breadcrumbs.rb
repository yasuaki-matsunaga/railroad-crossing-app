crumb :root do
  link "トップ", root_path
end

crumb :user_new do
  link "ユーザー登録", new_user_path
  parent :root
end

crumb :login do
  link "ログイン", login_path
  parent :root
end

crumb :password_reset do
  link "パスワードリセット申請", new_password_reset_path
  parent :login
end

crumb :password_edit do |user|
  link "パスワードリセット", edit_password_reset_path(user)
  parent :password_reset
end

crumb :crossing do |crossing|
  link "#{crossing.latitude}/#{crossing.longitude} (#{crossing.city.prefecture.prefecture_name} #{crossing.city.city_name})", crossing_path(crossing.crossing_id)
  parent :root
end

crumb :post do |post|
  link "#{post.title} (#{post.crossing.city.prefecture.prefecture_name} #{post.crossing.city.city_name})", crossing_post_path(post.crossing, post)
  parent :crossing, post.crossing
end

crumb :posts do
  link "投稿一覧", posts_path
  parent :root
end

crumb :post_new do |crossing|
  link "新規投稿", new_crossing_post_path(crossing)
  parent :crossing, crossing
end

crumb :post_edit do |post|
  link "投稿編集", edit_crossing_post_path(post.crossing, post)
  parent :post, post
end

crumb :profile do
  link "プロフィール", profile_path
  parent :root
end

crumb :profile_edit do
  link "プロフィール編集", edit_profile_path
  parent :profile
end

crumb :my_posts do
  link "My投稿", my_posts_path
  parent :profile
end

crumb :crossing_favorites do
  link "お気に入りフミキリ", crossing_favorites_path
  parent :profile
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).