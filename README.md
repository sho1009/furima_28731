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
| birth      | string | null: false |

### Association

- has_many :products
- has_many :item_purchases
- has_many :comments

## products テーブル

| Column           | Type   | Options     |
| ---------------  | ------ | ----------- |
| photo            | string | null: false |
| name             | string | null: false |
| explanation      | string | null: false |
| category         | string | null: false |
| condition        | string | null: false |
| postage_type     | string | null: false |
| prefectures      | string | null: false |
| preparation_days | string | null: false |
| value            | string | null: false |
| user             | string | null: false |

### Association

- belongs_to :user
- has_one :item_purchase
- has_many :comments

## item_purchases テーブル
| Column        | Type    | Options      |
| ------------- | ------- | ------------ |
| product       | integer | null: false, |
| user          | integer | null: false, |
| purchase_info | integer | null: false, |

### Association

- belongs_to :user
- belongs_to :product
- belongs_to :purchase_info


## comments テーブル
| Column  | Type       | Options      |
| ------- | ---------- | ------------ |
| content | string     | null: false  |
| user    | integer    | null: false, |
| product | integer    | null: false, |

### Association

- belongs_to :product
- belongs_to :user

## purchase_info テーブル

| Column        | Type       | Options      |
| ------------- | ---------- | ------------ |
| card_data     | string     | null: false  |
| card_deadline | string     | null: false  |
| security_code | string     | null: false  |
| postal_code   | string     | null: false  |
| prefectures   | integer    | null: false, |
| city          | string     | null: false  |
| address       | string     | null: false  |
| building_name | string     |              |
| phone_number  | string     | null: false  |
| item_purchase | integer    | null: false, |

### Association

- has_one_active_hash :prefectures
- has_one :item_purchase