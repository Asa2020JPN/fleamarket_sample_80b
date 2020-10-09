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
|birth_date     |date   |null: false              |
|icon_image     |string |                         |
|address_id     |integer|foreign_key: true        |
|credit_card_id |integer|foreign_key: true        |
### Association
- has_many :products
- has_many :likes
- has_many :comments
- has_many :reports
- has_many :histores
- has_one :address
- has_one :credit_card

## productsテーブル
|Column      |Type   |Options                       |
|------------|-------|------------------------------|
|name        |string |null: false                   |
|detail      |text   |null: false                   |
|price       |integer|null: false                   |
|user_id     |integer|null: false                   |
|brand_id    |integer|                              |
|prefecture  |integer|null: false, foreign_key: true|
|category    |integer|null: false, foreign_key: true|
|days_to_ship|integer|null: false, foreign_key: true|
|status      |integer|null: false, foreign_key: true|
|burden      |integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :brand
- has_many :likes
- has_many :comments
- has_many :reports
- has_many :imeges
- has_one :history
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :category
- belongs_to_active_hash :days_to_ship
- belongs_to_active_hash :status
- belongs_to_active_hash :burden

## likesテーブル
|Column    |Type   |Options                       |
|----------|-------|------------------------------|
|user_id   |integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product

### commentsテーブル
|Column    |Type    |Options                       |
|----------|--------|------------------------------|
|user_id   |integer |null: false, foreign_key: true|
|product_id|integer |null: false, foreign_key: true|
|text      |text    |null: false                   |
### Association
- belongs_to :user
- belongs_to :product

### reportsテーブル
|Column    |Type   |Options                       |
|----------|-------|------------------------------|
|user_id   |integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product

### brandsテーブル
|Column|Type  |Options    |
|------|------|-----------|
|name  |string|           |
### Association
- has_many :products

### imagesテーブル
|Column    |Type   |Options    |
|----------|-------|-----------|
|image     |string |null: false|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :product

### addressesテーブル
|Column      |Type   |Options|
|------------|-------|-------|
|postcode    |string |null: false |
|city        |string |null: false |
|block       |string |null: false |
|building    |string |            |
|phone_number|integer|unique: true|
|prefecture  |integer|null: false |
### Association
- belongs_to :user
- belongs_to_active_hash :prefecture

### credit_cardsテーブル
|Column       |Type  |Options                  |
|-------------|------|-------------------------|
|card_number  |string|null: false, unique: true|
|expiration   |string|null: false              |
|security_cord|string|null: false              |
### Association
- belongs_to :user

### historyテーブル
|Column    |Type   |Options    |
|----------|-------|-----------|
|user_id   |integer|null: false|
|product_id|integer|null: false|
### Association
- belongs_to :user
- belongs_to :product