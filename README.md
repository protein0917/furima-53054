# テーブル設計

## users テーブル

| Column              | Type       | Options      |
| --------            | ------     | -----------  |
| email               | string     | unique: true |
| encrypted_password  | string     | null: false  |
| name                | string     | null: false  |
| first_name          | string     | null: false  |
| last_name           | string     | null: false  |
| first_name_kana     | string     | null: false  |
| last_name_kana      | string     | null: false  |
| birthday            | date       | null: false  |
| user_id             | references | null: false  |

### Association

- has_many :items
- has_one :shipping_adress

## items テーブル

| Column           | Type       | Options     |
| --------         | ------     | ----------- |
| name             | string     | null: false |
| text             | text       | null: false |
| price            | integer    | null: false |
| brand            | text       | null: false |
| condition_id     | integer    | null: false |
| shipping_free_id | integer    | null: false |
| shipping_area_id | integer    | null: false |
| shipping_day_id  | integer    | null: false |
| category_id      | integer    | null: false |
| user             | references | null: false |

### Association

- belongs_to :user

## shipping_adress テーブル

| Column          | Type       | Options     |
| --------        | ------     | ----------- |
| post_code       | string     | null: false |
| shipping_area   | integer    | null: false |
| city            | string     | null: false |
| house_number    | string     | null: false |
| building_name   | string     |             |
| phone_number    | integer    | null: false |
| user            | references | null: false |

### Association

- belongs_to :user