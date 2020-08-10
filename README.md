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

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_reading  | string  | null: false |
| first_name_reading | string  | null: false |
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |
| birth_day          | integer | null: false |

### Association

- has_many :items
- has_many :comments

## items テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| image       |         | null: false |
| item_price  | integer | null: false |
| explanation | text    | null: false |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| text    | text    | null: false |
| user_id | integer | null: false |
| item_id | integer | null: false |

### Association

- belongs_to :user
- belongs_to :item
