## users テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_confirmation | string  | null: false |
| firstname             | string  | null: false |
| lastname              | string  | null: false |
| firstname_kana        | string  | null: false |
| lastname_kana         | string  | null: false |
| birth_date            | date    | null: false |



### Association

- has_many :items
- has_many :orders


## items テーブル

| Column                  | Type       | Options                        |
| ------------------------| ---------- | ------------------------------ |
| image                   | string     | null: false                    |
| name                    | string     | null: false                    |
| category                | string     | null: false                    |
| sales status            | string     | null: false                    |
| Shipping fee status     | string     | null: false                    |
| prefecture              | integer    | null: false                    |
| Scheduled delivery      | integer    | null: false                    |
| price                   | integer    | null: false                    |
| user                    | references | null: false ,foreign_key: true |


### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one :address

## addresses テーブル

| Column         | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| postal_code    | string     | null: false                   |
| prefecture     | integer    | null: false                   |
| city           | string     | null: false                   |
| house_number   | string     | null: false                   |
| building_name  | string     |                               |
| phone_number   | string     | null:false                    |
| order          | references | null:false, foreign_key: true |

### Association

- belongs_to :order
