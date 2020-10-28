# README

# furima DB設計

## usersテーブル
|Column         |Type   |Options                  |
|---------------|-------|-------------------------|
|nickname       |string |null: false              |
|email          |string |null: false, unique: true|
|password       |string |null: false              |
|last_name      |string |null: false              |
|first_name     |string |null: false              |
|last_name_kana |string |null: false              |
|first_name_kana|string |null: false              |
|birthday       |date   |null: false              |
|icon_image     |string |                         |
### Association
- has_many :products
- has_many :likes
- has_many :comments
- has_many :reports
- has_many :purchase_histories
- has_one  :address
- has_one  :credit_card

## productsテーブル
|Column          |Type      |Options                       |
|----------------|----------|------------------------------|
|name            |string    |null: false                   |
|detail          |text      |null: false                   |
|price           |integer   |null: false                   |
|user_id         |references|null: false, foreign_key: true|
|brand_id        |references|foreign_key: true             |
|prefecture_id   |integer   |null: false                   |
|category_id     |integer   |null: false                   |
|shipping_id     |integer   |null: false                   |
|status_id       |integer   |null: false                   |
|shippingcost_id |integer   |null: false                   | 
### Association
- belongs_to :user
- belongs_to :brand
- has_many :likes
- has_many :comments
- has_many :reports
- has_many :imeges
- has_one :purchase_history
- belongs_to_active_hash :prefecture
- belongs_to :category
- belongs_to_active_hash :days_to_ship
- belongs_to_active_hash :status
- belongs_to_active_hash :shipping

## likesテーブル
|Column    |Type      |Options                       |
|----------|----------|------------------------------|
|user_id   |references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product

## commentsテーブル
|Column    |Type      |Options                       |
|----------|----------|------------------------------|
|user_id   |references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
|text      |text      |null: false                   |
### Association
- belongs_to :user
- belongs_to :product

## reportsテーブル
|Column    |Type      |Options                       |
|----------|----------|------------------------------|
|user_id   |references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product

## brandsテーブル
|Column|Type  |Options    |
|------|------|-----------|
|name  |string|null: false|
### Association
- has_many :products

## imagesテーブル
|Column    |Type      |Options                       |
|----------|----------|------------------------------|
|image     |string    |null: false                   |
|product_id|references|null: false, foreign_key: true|
### Association
- belongs_to :product

## addressesテーブル
|Column       |Type      |Options     |
|-------------|----------|------------|
|postcode     |string    |null: false |
|city         |string    |null: false |
|block        |string    |null: false |
|building     |string    |            |
|phone_number |string    |unique: true|
|prefecture_id|integer   |null: false |
|user_id      |references|null: false |
### Association
- belongs_to :user
- belongs_to_active_hash :prefecture

## credit_cardsテーブル
|Column     |Type      |Options                       |
|-----------|----------|------------------------------|
|customer_id|string    |null, false                   |
|card_id    |string    |null, false                   |
|user_id    |references|null: false, foreign_key: true|
### Association
- belongs_to :user

## purchase_historyテーブル
|Column    |Type      |Options                        |
|----------|----------|-------------------------------|
|user_id   |references|null: false,  foreign_key: true|
|product_id|references|null: false,  foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product

## categoriesテーブル
|Column    |Type      |Options                        |
|----------|----------|-------------------------------|
|name      |string    |null: false,       unique: true|
|ancestry  |string    |                               |
### Association
- has_ancestry
