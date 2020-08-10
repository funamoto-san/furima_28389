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
- has_one :address

## items テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| image       |         | null: false |
| price       | integer | null: false |
| explanation | text    | null: false |
| category    | integer | null: false |
| item_state  | text    | null: false |

### Association

- belongs_to :user
- has_many :comments
- has_one :address

## comments テーブル

| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| text    | text    | null: false |
| user_id | integer | null: false |
| item_id | integer | null: false |

### Association

- belongs_to :user
- belongs_to :item

## orders テーブル

| Column       | Type    | Options          |
| ------------ | ------- | -----------------|
| user_id      | integer | null: false      |
| item_id      | integer | null: false      |

### Association

- belongs_to :user

## address テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ------------|
| postal_code   | string  | null: false |
| prefecture    | integer | null: false |
| city          | string  |             |
| house_number  | string  |             |
| building_name | string  |             |
| tel_number    | integer | null: false |

### Association

- belongs_to :user
- belongs_to :item