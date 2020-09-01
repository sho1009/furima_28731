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


#
## users テーブル

| Column   　| Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email   　 | string | null: false |
| password　 | string | null: false |
| first_name | string | null: false |
| last_name  | string | null: false |
| read_first | string | null: false |
| read_last  | string | null: false |
| birth      | date   | null: false |

### Association

- has_many :products
- has_many :item_purchases
- has_many :comments

## products テーブル

| Column           | Type       | Options                      |
| ---------------  | ---------  | ---------------------------- |
| photo            | string     | null: false                  |
| name             | string     | null: false                  |
| explanation      | text       | null: false                  |
| category         | integer    | null: false                 |
| condition        | integer    | null: false                  |
| postage_type     | integer    | null: false,foreign_key:true |
| prefectures      | integer    | null: false,foreign_key:true |
| preparation_days | integer    | null: false,foreign_key:true |
| value            | integer    | null: false                  |
| user             | references | null: false,foreign_key:true |

### Association

- belongs_to :user
- has_one :item_purchase
- has_many :comments

## item_purchases テーブル
| Column        | Type       | Options                      |
| ------------- | ---------- | ---------------------------- |
| product       | references | null: false,foreign_key:true |
| user          | references | null: false,foreign_key:true |


### Association

- belongs_to :user
- belongs_to :product
- has_one :address

## addres テーブル

| Column        | Type       | Options      |
| ------------- | ---------- | ------------ |
| postal_code   | string     | null: false  |
| prefectures   | integer    | null: false, |
| city          | string     | null: false  |
| address       | string     | null: false  |
| building_name | string     | null: false  |
| phone_number  | string     | null: false                   |
| item_purchases| references | null: false,foreign_key:true |
### Association

- belong_to :item_purchase