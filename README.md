# テーブル設計

## Users テーブル

| Column                | Type   | Options                   |
| --------------------- | ------ | --------------------------|
| user_name             | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |
| last_name             | string | null: false               |
| first_name            | string | null: false               |
| last_name_ruby        | string | null: false               |
| first_name_ruby       | string | null: false               |
| birth_date            | date   | null: false               |

### Association

- has_many :items
- has_many :orders


## Items テーブル

| Column                | Type         | Options                        |
| --------------------- | ------------ | ------------------------------ |
| item_name             | string       | null: false                    |
| summary               | text         | null: false                    |
| category_id           | integer      | null: false                    |
| condition_id          | integer      | null: false                    |
| delivery_charge_id    | integer      | null: false                    |
| prefecture_id         | integer      | null: false                    |
| delivery_day_id       | integer      | null: false                    |
| price                 | integer      | null: false                    |
| user                  | references   | null: false, foreign_key: true |

### Association

- has_one:order
- belongs_to :user


## Orders テーブル

| Column                | Type         | Options                        |
| --------------------- | ------------ | ------------------------------ |
| user                  | references   | null: false, foreign_key: true |
| item                  | references   | null: false, foreign_key: true |

### Association

- has_one :ship
- belongs_to :user
- belongs_to :item


## Ships テーブル

| Column                | Type         | Options                        |
| --------------------- | ------------ | ------------------------------ |
| post_code             | string       | null: false                    |
| prefecture_id         | integer      | null: false                    |
| city                  | string       | null: false                    |
| house_number          | string       | null: false                    |
| building_number       | string       |                                |
| phone_number          | string       | null: false                    |
| order                 | references   | null: false, foreign_key: true |

### Association

- belongs_to :order