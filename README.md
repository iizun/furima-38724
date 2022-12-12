# テーブル設計

## Users テーブル

| Column                | Type   | Options                   |
| --------------------- | ------ | --------------------------|
| user_name             | string | null: false               |
| email                 | string | null: false, unique: true |
| password              | string | null: false               |
| password_confirmation | string | null: false               |
| last_name             | string | null: false               |
| first_name            | string | null: false               |
| last_name_ruby        | string | null: false               |
| last_name_ruby        | string | null: false               |
| birth_date            | date   | null: false               |

### Association

- has_many :items
- has_many :orders


## Items テーブル

| Column                | Type         | Options                        |
| --------------------- | ------------ | ------------------------------ |
| image                 | BLOB         | null: false                    |
| item_name             | string       | null: false                    |
| summary               | text         | null: false                    |
| category              | string       | null: false                    |
| condition             | string       | null: false                    |
| delivery_charge       | string       | null: false                    |
| shipping_charge       | string       | null: false                    |
| delivery_days         | string       | null: false                    |
| price                 | integer      | null: false                    |
| user_id               | references   | null: false, foreign_key: true |

### Association

- has_one    :order
- belongs_to :user


## Orders テーブル

| Column                | Type         | Options                        |
| --------------------- | ------------ | ------------------------------ |
| user_id               | references   | null: false, foreign_key: true |
| item_id               | references   | null: false, foreign_key: true |

### Association

- has_one :ship
- belongs_to :user
- belongs_to :item


## Ships テーブル

| Column                | Type         | Options                        |
| --------------------- | ------------ | ------------------------------ |
| post_code             | string       | null: false                    |
| prefecture            | string       | null: false                    |
| city                  | string       | null: false                    |
| house_number          | string       | null: false                    |
| delivery_charge       | string       | null: false                    |
| building_number       | string       |                                |
| phone_number          | string       | null: false                    |
| order_id              | references   | null: false, foreign_key: true |

### Association

- belongs_to :order