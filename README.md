# railroad-crossing-app
## サービス概要 
〜踏切の位置検索と写真投稿〜 
『フミキリのちず』は、全国の踏切の位置情報の検索と、写真投稿ができるサービスです。
踏切の位置の検索は、都道府県、市町村、路線ごとの検索に加え、現在地周辺の踏切や、表示されている地図範囲での検索ができます。
それぞれの踏切詳細ページから写真と文章を投稿することができます。

## サービスURL
### https://fumikiri-map.com/

## サービス開発の背景 
子供が踏切が好きなことがきっかけで、Googleマップ等の地図アプリで踏切の位置を調べようとしたところ、踏切の位置情報がない、あるいは、簡単に検索ができなかったため、このWEBアプリを作成しました。
踏切には×標識や警告灯などに様々な形があり、子供が見たい踏切や、見たことがない形の踏切を見つけたいと思ったことがきっかけです。  

## 機能紹介  
#### ユーザー登録
『名前』『メールアドレス』『パスワード』『確認用パスワード』を入力してユーザー登録を行います。Googleアカウントを用いてGoogleログインを行う事も可能です。
 
#### 踏切の検索
踏切を検索すると地図上にマーカーが表示されます。以下の検索方法があります。
- 都道府県
- 市町村
- 路線
- 現在位置から半径2km以内
- 現在表示されている地図範囲内

#### 踏切の投稿をする 
全国の各踏切について、写真と文章を投稿できます。

#### コメント
各投稿には、コメントをすることができます。


## 使用技術
|カテゴリ|技術内容|
| :---: | :---: |
|サーバーサイド|Ruby on Rails・Ruby|
|フロントエンド|Ruby on Rails・JavaScript・leaflet|
|CSSフレームワーク|bootstrap|
|データベースサーバー|PostgreSQL|
|ファイルサーバー|AWS S3|
|アプリケーションサーバー|Heroku|
|バージョン管理ツール|GitHub|

## 画面遷移図  
https://www.figma.com/design/uipeoG2C6HhMtySCGapj4A/%E3%80%90%E8%B8%8F%E5%88%87%E3%82%A2%E3%83%97%E3%83%AA%E3%80%91%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?node-id=0-1&t=bHWpGo2W8tUp0swy-1

## ER図  
[https://gyazo.com/7b4fbcb1cd7bafa22c8458aaa7ba3ff4](https://gyazo.com/3cadcdb65abf2d8464829c0ce76a466a)
