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
| last_name             | string  | null: false |
| first_name            | string  | null: false |
| last_name_reading     | string  | null: false |
| first_name_reading    | string  | null: false |
| birthday              | date    | null: false |

### Association
has_many :items
has_many :purchases

## items テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| item_name            | string     | null: false                    |
| item_detail          | text       | null: false                    |
| item_category        | integer    | null: false                    |
| item_condition       | integer    | null: false                    |
| covered_shipping_by  | integer    | null: false                    |
| prefecture           | integer    | null: false                    |
| days_til_ship        | integer    | null: false                    |
| price                | integer    | null: false                    |

### Association
belongs_to :user
has_one    :purchase
has_one    :address
has_one_attached :image

## addresses テーブル
| Column           | Type       | Options                            |
| ---------------- | ---------- | ---------------------------------- |
| user             | references | null: false, foreign_key: true     |
| item             | references | null: false, foreign_key: true     |
| postal_code      | string     | default: "", null: false           |
| prefecture_id    | integer    | null: false                        |
| city             | string     | default: "", null: false           |
| address_line     | string     | default: "", null: false           |
| building_unit    | string     |                                    |
| phone_number     | string     |default: "", null: false            |

belongs_to :item
belongs_to :user

## purchases テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association
belongs_to :item
belongs_to :user