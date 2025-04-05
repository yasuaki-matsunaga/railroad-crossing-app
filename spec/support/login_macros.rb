module LoginMacros
  def login_as(user)
    visit login_path
    expect(page).to have_content('ログイン')  # ログインページの特定の要素が表示されるまで待機
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: 'password1234'
    find("input.btn-warning[value='ログイン']").click  # 明示的に指定
    expect(page).to have_content('ログアウト', wait: 5)  # Turboの影響を考慮
  end
end