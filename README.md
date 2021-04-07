# DB設計


## users table

| Column                 | Type                | Options                  |
|------------------------|---------------------|--------------------------|
| email                  | string              | null: false, unique: true|
| encrypted_password     | string              | null: false              |
| nickname               | string              | null: false              |
| first_name             | string              | null: false              |
| last_name              | string              | null: false              |
| first_name_katakana    | string              | null: false              |
| last_name_katakana     | string              | null: false              |
| birth_day              | datetime            | null: false              |


### Association

- has_many :items
<!-- - has_many :comments -->
- has_many :buyers



## items table

| Colum              | Type                | Options                 |
| ------------------ | ------------------- | ----------------------- |
| title              | string              | null: false             |
| explain            | text                | null: false             |
| category_id        | integer             | null: false             |
| state_id           | integer             | null: false             |
| delivery_fee_id    | integer             | null: false             |
| owner_region_id    | integer             | null: false             |
| delivery_date_id   | integer             | null: false             |
| price              | integer             | null: false             |
| user               | references          | foreign_key: true       |


### Association 

<!-- - has_many    :comments -->
- belongs_to  :user
- has_one     :buyer



<!-- ## comments table

| Colum              | Type                | Options                 |
| ------------------ | ------------------- | ----------------------- |
| text               | text                | null: false             |
| user               | references          | foreign_key: true       |
| item               | references          | foreign_key: true       |
 -->

<!-- ### Association

- belongs_to :user
- belongs_to :items -->



## buyers table 

| Colum              | Type                | Options                 |
| ------------------ | ------------------- | ----------------------- |
| user               | references          | foreign_key: true       |
| item               | references          | foreign_key: true       |


### Association

- belongs_to  :item
- has_one     :delivery_info
- belongs_to  :user




## delivery_info table

| Colum              | Type                | Options                 |
| ------------------ | ------------------- | ----------------------- |
| postal_code        | string              | null: false             |
| prefecture_id      | integer             | null: false             |
| city               | string              | null: false             |
| address            | string              | null: false             |
| building           | string              |                         |
| phone_number       | string              | null: false             |
| buyers             | references          | foreign_key: true       |


### Association

- belongs_to :buyer