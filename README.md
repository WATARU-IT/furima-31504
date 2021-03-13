# README

## usersテーブル

| Column           | Type   | Options                   |
| ---------------- | ------ | ------------------------- |
| nickname         | string | null: false               |
| email            | string | null: false, unique: true |
| user_password    | string | null: false               |
| family_name      | string | null: false               |
| first_name       | string | null: false               |
| family_name_kana | string | null: false               |
| first_name_kana  | string | null: false               |
| birth_day        | date   | null: false               |

### Association
- has_many :items 
- has_many :orders

## itemsテーブル

| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| name            | string  | null: false                    |
| price           | string  | null: false                    |
| text            | string  | null: false                    |
| status_id       | integer | null: false                    |
| shipping_day_id | integer | null: false                    |
| prefecture_id   | integer | null: false                    |
| category_id     | integer | null: false                    |
| bearer_id       | integer | null: false                    |
| user            | string  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## ordersテーブル

| Column  | Type   | Options                        |
| ------- | ------ | ------------------------------ |
| user_id | string | null: false, foreign_key: true |
| item_id | string | null: false, foreign_key: true |

### Association
- has_one :buyer
- belongs_to :user
- belongs_to :item

## buyersテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association
- belongs_to :order
