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
| category_id(active_hash)      | integer    | null: false,foreign_key_true  |
| status_id(active_hash)        | integer    | null: false,foreign_key_true  |
| burden_id(active_hash)        | integer    | null: false,foreign_key_true  |
| prefecture_id(active_hash)    | integer    | null: false,foreign_key_true  |
| shipping_days_id(active_hash) | integer    | null: false,foreign_key_true  |

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
| building_name  | string     | null: false                   |
| order          | references | null: false,foreign_key_true  |
| phone_number   | string     | null: false                   |
| prefecture_id  | integer    | null: false                   |                  
| postal_code    | string     | null: false                   |
| city           | string     | null: false                   |

### Association

belongs_to: order

