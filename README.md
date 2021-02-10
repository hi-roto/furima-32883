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
- has_many :purchase_records

## items テーブル

| Column             | Type       | Options                        |
| -------------------| -----------| -------------------------------|
| item_name          | string     | null: false                    |
| introduct          | text       | null: false                    |
| category_id        | integer    | null: false                    |
| item_status_id     | integer    | null: false                    |
| postage_payer_id   | integer    | null: false                    |
| region             | string     | null: false                    |
| preparation_day_id | integer    | null: false                    |
| price              | integer    | null: false                    |
| saler_id           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase_record

## purchase_records テーブル

| Column      | Type       | Options                        |
| ------------| ---------- | ------------------------------ |
| user        | references | null: false  foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :shipping_adress
- has_one :shipping_adress

## shipping_adresses テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| postal_code      | integer(7) | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | integer    | null: false                    |
| phone_number     | integer    | null: false                    |
| building_name    | string     |                                |
| purchase_record  | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase_record