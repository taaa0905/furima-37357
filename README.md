# テーブル設計

## users テーブル

| Column             | Type   | Options                   | 
| ------------------ | ------ | ------------------------- |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| f_first_name       | string | null: false               |
| f_last_name        | string | null: false               |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| dob                | date   | null: false               |

### Association

- has_many :items
- has_many :purchases
- has_many :address
- has_many :comments

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product_name        | string     | null: false                    |
| explanation         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| condition_id        | integer    | null: false                    |
| shipping_charge_id  | integer    | null: false                    |
| item_area_id        | integer    | null: false                    |
| packaging_day_id    | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase
- has_many   :comments

## purchase テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| card_number         | integer    | null: false                    |
| expiry              | date       | null: false                    |
| security_code       | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :item
- belongs_to :address


## address テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| post_code           | integer    | null: false                    |
| prefecture          | string     | null: false                    |
| city                | string     | null: false                    |
| block               | string     | null: false                    |
| building            | string     | null: true                     |
| tel_number          | integer    | null: false                    |
| item                | references | null: false, foreign_key: true |
| purchase            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :purchase

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments
