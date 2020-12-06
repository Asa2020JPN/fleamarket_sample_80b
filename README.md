# README

# furima DB設計

## usersテーブル
|Column         |Type   |Options                  |
|---------------|-------|-------------------------|
|nickname       |string |null: false              |
|email          |string |null: false, unique: true|
|password       |string |null: false              |
### Association
- has_many :products
- has_one :address
- has_one :identification
- has_one :payment_selected

## productsテーブル
|Column          |Type      |Options                       |
|----------------|----------|------------------------------|
|name            |string    |null: false                   |
|detail          |text      |null: false                   |
|price           |integer   |null: false                   |
|prefecture_id   |integer   |null: false                   |
|category_id     |integer   |null: false                   |
|shipping_id     |integer   |null: false                   |
|status_id       |integer   |null: false                   |
|shippingcost_id |integer   |null: false                   |
|buyer_id        |integer   |null: false                   |
|saler_id        |integer   |null: false                   |
### Association
- belongs_to :saler
- belongs_to :category
- has_one :brand
- has_many :imeges
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :shippingcost
- belongs_to_active_hash :status
- belongs_to_active_hash :shipping

## brandsテーブル
|Column |Type      |Options          |
|-------|----------|-----------------|
|name   |string    |null: false      |
|product_id|references|foreign_key: true|
### Association
- has_many :products

## imagesテーブル
|Column       |Type      |Options                       |
|-------------|----------|------------------------------|
|image        |string    |null: false                   |
|product_id   |references|null: false, foreign_key: true|
### Association
- belongs_to :product

## addressesテーブル
|Column       |Type      |Options       |
|---------------|----------|------------|
|postcode       |string    |null: false |
|city           |string    |null: false |
|block          |string    |null: false |
|building       |string    |            |
|phone_number   |string    |unique: true|
|prefecture_id  |integer   |null: false |
|user_id        |references|null: false |
|last_name      |string    |null: false |
|first_name     |string    |null: false |
|last_name_kana |string    |null: false |
|first_name_kana|string    |null: false |
### Association
- belongs_to :user
- belongs_to_active_hash :prefecture

## cardsテーブル
|Column     |Type      |Options                       |
|-----------|----------|------------------------------|
|customer_id|string    |null, false                   |
|card_id    |string    |null, false                   |
|user_id    |references|null: false, foreign_key: true|
### Association
- has_one :payment_selected

## payment_selectedsテーブル
|Column        |Type      |Options                       |
|--------------|----------|------------------------------|
|card_id       |references|foreign_key: true             |
|card_selected |string    |null, false                   |
|user_id       |references|null: false, foreign_key: true|
|id_path       |string    |                              |
### Association
- has_one :payment_selected
- belongs_to :card

## identificationsテーブル
|Column         |Type      |Options                       |
|---------------|----------|------------------------------|
|user_id        |references|null: false, foreign_key: true|
|last_name      |string    |null: false                   |
|first_name     |string    |null: false                   |
|last_name_kana |string    |null: false                   |
|first_name_kana|string    |null: false                   |
|birthday       |date      |null: false                   |
### Assocuation
- belongs_to :user

## categoriesテーブル
|Column    |Type      |Options                        |
|----------|----------|-------------------------------|
|name      |string    |null: false,       unique: true|
|ancestry  |string    |                               |
### Association
- has_ancestry
- has_many :products
