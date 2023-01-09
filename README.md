# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| firstname          | string | null: false               |
| lastname           | string | null: false               |
| pronounce_firstname| string | null: false               |
| pronounce_lastname | string | null: false               |
| nickname           | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :purchased_items



## itemsテーブル
| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| name               | string       | null: false                    |
| explanat           | text         | null: false                    |
| price              | integer      | null: false                    |
| category_id        | integer      | null: false                    |
| status_id          | integer      | null: false                    |
| derivery_charge_id | integer      | null: false                    |
| sender_area_id     | integer      | null: false                    |
| daystosend_id      | integer      | null: false                    |
| user               | references   | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :purchased_item


## purchased_itemsテーブル
| Column                  | Type         | Options                        |
| ----------------------- | ------------ | ------------------------------ |
| item                    | references   | null: false, foreign_key: true |
| user                    | references   | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :buyer

## buyersテーブル
| Column                  | Type         | Options                        |
| ----------------------- | ------------ | ------------------------------ |
| postal_code             | string       | null: false                    |
| sender_area_id          | integer      | null: false                    |
| municipality            | string       | null: false                    |
| house_number            | string       | null: false                    |
| building_name           | string       |                                |
| tell                    | string       | null: false                    |
| purchased_item          | references   | null: false, foreign_key: true |

### Association
- belongs_to :purchased_item
