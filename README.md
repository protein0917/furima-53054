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
- has_one :profile
- has_one :shipping_adress
- has_one :credit_card

## items テーブル

| Column        | Type       | Options     |
| --------      | ------     | ----------- |
| name          | string     | null: false |
| text          | text       | null: false |
| price         | integer    | null: false |
| brand         | text       | null: false |
| condition     | integer    | null: false |
| shipping_free | integer    | null: false |
| shipping_area | integer    | null: false |
| shipping_day  | integer    | null: false |
| category      | references | null: false |
| seller        | references | null: false |
| buyer         | references | null: false |

### Association

- has_many :item_images
- belongs_to :item_category
- belongs_to :user

## item_categories テーブル

| Column   | Type       | Options     |
| -------- | ------     | ----------- |
| name     | string     | null: false |
| ancestry | string     | null: false |

### Association

- has_many :items

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