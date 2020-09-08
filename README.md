# README

# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------        | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| birth_date      | date   | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                        | Type       | Options                       |
| ----------------------------- | ---------- | ----------------------------- |
| user                          | references | null: false,foreign_key_true  |
| name                          | string     | null: false                   |
| price                         | integer    | null: false                   |
| explanation                   | text       | null: false                   |
| category_id(active_hash)      | integer    | null: false                   |
| status_id(active_hash)        | integer    | null: false                   |
| burden_id(active_hash)        | integer    | null: false                   |
| prefecture_id(active_hash)    | integer    | null: false                   |
| shipping_days_id(active_hash) | integer    | null: false                   |

### Association

- has_one : order
- belongs_to: user

## orders テーブル

| Column                        | Type       | Options                       |
| ----------------------------- | ---------- | ----------------------------- |
| item                          | references | null: false,foreign_key_true  |
| user                          | references | null: false,foreign_key_true  |

### Association

belongs_to: item
belongs_to: user
has_one: address

## address

| Column         | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| building_name  | string     |                               |
| order          | references | null: false,foreign_key_true  |
| phone_number   | string     | null: false                   |
| prefecture_id  | integer    | null: false                   |                  
| postal_code    | string     | null: false                   |
| city           | string     | null: false                   |
| house_number   | string     | null: false                   |

### Association

belongs_to: order

