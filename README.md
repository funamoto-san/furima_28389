# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_confirmation | string  | null: false |
| last_name             | string  | null: false |
| first_name            | string  | null: false |
| last_name_reading     | string  | null: false |
| first_name_reading    | string  | null: false |
| birthday              | date    | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :orders

## items テーブル

| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
<!-- | image      | string  | null: false     | アクティブストレージで管理している -->
| name               | string  | null: false                    |
| price              | integer | null: false                    |
| explanation        | text    | null: false                    |
| category_id        | integer | null: false                    |
| state_id           | integer | null: false                    |
| delivery_charge_id | integer | null: false                    |
| shipping_region_id | integer | null: false                    |
| shipping_day_id    | integer | null: false                    |
| user_id            | integer | null: false, foreign_key: true |
| buyer_id           | integer |              foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :order

## comments テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| text    | text    | null: false                    |
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## orders テーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| user_id          | integer | null: false, foreign_key: true |
| item_id          | integer | null: false, foreign_key: true |
| card_number      | integer | null: false                    |
| expiration_month | integer | null: false                    |
| expiration_year  | integer | null: false                    |
| security_code    | integer | null: false                    |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| postal_code        | string  | null: false                    |
| shipping_region_id | integer | null: false                    |
| city               | string  | null: false                    |
| house_number       | string  | null: false                    |
| building_name      | string  |                                |
| tel_number         | string  | null: false                    |
| order_id           | integer | null: false, foreign_key: true |

### Association

- belongs_to :order
