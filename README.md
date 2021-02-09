# テーブル設計

## users テーブル

| Column          | Type   | Options                  |
| ----------------| ------ | -------------------------|
| nickname        | string | null: false              |
| email           | string | null: false, unique: true|
| password        | string | null: false              |
| last_name       | string | null: false              |
| first_name      | string | null: false              |
| last_name_kana  | string | null: false              |
| first_name_kana | string | null: false              |
| birth_day       | date   | null: false              |

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column             | Type       | Options                        |
| -------------------| -----------| -------------------------------|
| item_name          | string     | null: false                    |
| introduct          | text       | null: false                    |
| category_id        | integer    | null: false                    |
| item_status_id     | integer    | null: false                    |
| postege_payer_id   | integer    | null: false                    |
| region             | string     | null: false                    |
| preperration_day_id| integer    | null: false                    |
| price              | integer    | null: false                    |
| saler_id           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :purchases, through: entries
- has_many :entries

## entries テーブル

| Column      | Type       | Options                        |
| ------------| ---------- | ------------------------------ |
| purchase_id | references | null: false, foreign_key: true |
| item_id     | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase
- belongs_to :item

## purchases テーブル

| Column      | Type       | Options                        |
| ------------| ---------- | ------------------------------ |
| buyer       | string     | null: false                    |
| buy_item    | references | null: false, foreign_key: true |
| buyer_id    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :items, through: entries
- has_many :entries
- has_one :shipping

## shipping テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| postal_code      | integer(7) | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | integer    | null: false                    |
| phone_number     | integer    | null: false                    |
| purchase_id      | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase
- has_one :shipping_building

## shipping_building テーブル

| Column         | Type       | Options                        |
| ------------   | ---------- | ------------------------------ |
| building_name  | string     | null: false                    |
| shipping_id    | references | null: false, foreign_key: true |

### Association
- belongs_to :shipping
