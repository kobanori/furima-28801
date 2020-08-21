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

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_one :profile

## profiles テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| last_name        | string     | null: false                    |
| first_name       | string     | null: false                    |
| last_name_kana   | string     | null: false                    |
| first_name_kana  | string     | null: false                    |
| birth_year       | integer    | null: false                    |
| birth_month      | integer    | null: false                    |
| birth_day        | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |


### Association

- belongs_to :user

## items テーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| name                    | string     | null: false                    |
| description             | text       | null: false                    |
| category_id             | integer    | null: false                    |
| condition_id            | integer    | null: false                    |
| postage_id              | integer    | null: false                    |
| prefecture_id           | integer    | null: false                    |
| set_up_time_id          | integer    | null: false                    |
| price                   | integer    | null: false                    |
| buyer_id                | integer    | null: false                    |
| user_id                 | references | null: false, foreign_key: true |

### Association

- has_many :comments
- has_one :order

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| item_id | references | null: false, foreign_key: true |

### Association
- belongs_to :item

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| price   | integer    | null: false                    |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :delivery

## deliveries テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postcode         | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| block            | string     | null: false                    |
| building         | string     |                                |
| phone_number     | string     | null: false                    |
| order_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :order