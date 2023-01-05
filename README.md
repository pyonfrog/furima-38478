# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| password　　　　　　 | string | null: false               |
| name               | string | null: false               |
| pronounce_name     | string | null: false               |
| nickname           | string | null: false               |
| birthday           | string | null: false               |

### Association
- has_many :items
- has_one  :buyer


## itemsテーブル
| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| name               | string       | null: false                    |
| explanat           | text         | null: false                    |
| image              | image        | null: false                    |
| price              | string       | null: false                    |
| category           | string       | null: false                    |
| status             | string       | null: false                    |
| deriverycharge　　　| string       | null: false                    |
| sender_area        | string       | null: false                    |
| daystosend         | string       | null: false                    |
| comment            | text         | null: false                    |
| user               | references   | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :buyer


## buyersテーブル
| Column                  | Type         | Options                        |
| ----------------------- | ------------ | ------------------------------ |
| card_number             | string       | null: false                    |
| card_limit              | string       | null: false                    |
| card_securitycode       | string       | null: false                    |
| address                 | string       | null: false                    |
| tell                    | string       | null: false                    |
| item                    | references   | null: false, foreign_key: true |
| user                    | references   | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item