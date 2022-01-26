# テーブル設計

## users テーブル

| Column             | Type   | Options                   | 
| ------------------ | ------ | ------------------------- |
| user_name          | string | null: false
| nickname           | string | null: false
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| furigana           | string | null: false               |
| dob                | string | null: false               |

### Association

- has_many :items
- has_many :comments

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product_name        | string     | null: false                    |
| explanation         | text       | null: false                    |
| category            | string     | null: false                    |
| condition           | string     | null: false                    |
| shipping charges    | string     | null: false                    |
| item_area           | string     | null: false                    |
| days                | string     | null: false                    |
| price               | string     | null: false                    |
| commission          | string     | null: false                    |
| margin              | string     | null: false                    |
| user                | string     | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments

## comments テーブル

| Column    | Type       | Options                        |
| ----------| -----------| ------------------------------ |
| content   | text       | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :prototypes
