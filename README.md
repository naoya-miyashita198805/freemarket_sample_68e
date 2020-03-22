# README
<h1 align="center">freemarket_sample_68e</h1>
<img width="1430" alt="スクリーンショット 2020-03-10 13 41 08" src="https://user-images.githubusercontent.com/59730607/77245433-ece0bb80-6c61-11ea-9df5-749821231813.png">

# 機能：商品の出品、登録、編集、削除、購入、カード情報の登録、削除、ユーザー情報登録

## 制作に至った経緯
プログラミングスクールにおける最終課題かつチーム開発です。

## 意識した点
### 機能面
　現在、情報の収集や操作はPCよりスマートフォンやタブレット端末の利用が多いのを考慮し、スマートフォン、ipad、PCに対応したビューの調整を行いました。
  * スマートフォン　（画像は横２枚　縦５列で合計１０枚　投稿可能）

<img width="300" alt="スクリーンショット 2020-03-13 17 08 30" src="https://user-images.githubusercontent.com/59730607/77245468-23b6d180-6c62-11ea-924c-0ef1aa91de75.png" >

  * ipad　（画像は横５枚　縦２列で合計１０枚　投稿可能）

<img width="500" alt="スクリーンショット 2020-03-10 13 55 02" src="https://user-images.githubusercontent.com/59730607/77245504-5365d980-6c62-11ea-824e-c72bbc261286.png">

  * PC　（画像は横５枚　縦２列で合計１０枚　投稿可能）

<img width="1440" alt="スクリーンショット 2020-03-10 13 56 12" src="https://user-images.githubusercontent.com/59730607/77245621-354ca900-6c63-11ea-97f7-859e8c9b23ab.png">

　ヘッダー部分のアイコンを押した際、トップページに遷移するようにして利便性を向上させております。(gifファイルです。動かない場合はお手数ですがリロードを試してください。)

![ccb31bd07bb657623239fcc255c2fc9f](https://user-images.githubusercontent.com/59730607/77245908-bf960c80-6c65-11ea-84e7-879e1faa2745.gif)

### 技術面
* Githubの操作を積極的に試せました。
　最終課題挙動確認https://github.com/okiku-stt/freemarket_sample_68e/issues/101
や、自分のタスク管理（ブランチを切った時などに）にissuesを活用しました。
また Milestoneも活用し自分のtrelloの修了条件を書き込み進捗を確認できるようにしました。（下の画像のことです。）
しかし、まだまだ使いこなせているとは言えないのでこれからもGithubの操作や理解を掘り下げていきます。
<img width="1110" alt="スクリーンショット 2020-03-13 17 52 22" src="https://user-images.githubusercontent.com/59730607/77245668-a68c5c00-6c63-11ea-9927-d250ba755042.png">

## 今後、追加実装するならば
* 商品の検索機能を追加し利便性を向上させる。
* カード情報を複数表示させる。

## DB設計

<img width="870" alt="スクリーンショット 2020-03-13 16 52 15" src="https://user-images.githubusercontent.com/59730607/77245785-8dd07600-6c64-11ea-9acd-26fb0c132df1.png">

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true, add_index|
|email|string|null: false, unique: true, add_index|
|password|string|null: false|
|family_name|string|null: false|
|last_name|string|null: false|
|j_family_name|string|null: false|
|j_last_name|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
### Association
- has_one :address
- has_many :cards
- has_many: exibitions

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|integer|null: false|
|card_id|integer|null: false|
### Association
- belongs_to :user

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|ship_family_name|string|null: false|
|ship_last_name|string|null: false|
|ship_j_family_name|string|null: false|
|ship_j_last_name|string|null: false|
|postal_code|integer|null: false|
|prefectures|string|null: false|
|municipalities|string|null: false|
|house_number|string|null: false|
|building|string||
|phone_number|integer||
### Association
- belongs_to :user

## exhibitionsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|category_id|string|null: false, foreign_key: true|
|shipping_charges|string|null: false|
|prefecture_id|integer|null: false|
|shipping_date|string|null: false|
|price|integer|null: false|
|item_name|string|null: false|
|item_status|string|null: false|
|item_description|text|null: false|
|deal|integer|default: 0, null: false, limit: 1|
|bland|string||
### Association
- belongs_to :user
- belongs_to :category
- has_many :images

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|item|string|null: false, add_index|
|ancestry|string||
### Association
- has_many :exhibitions

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|exhibitions_id|integer|null: false,foreign_key: true|
### Association
- belongs_to :exhibition