# DB設計


## users table

| Column                 | Type                | Options                 |
|------------------------|---------------------|-------------------------|
| email                  | string              | null: false             |
| password               | string              | null: false             |
| nickname               | string              | null: false             |
| first_name             | string              | null: false             |
| last_name              | string              | null: false             |
| first_name_katakana    | string              | null: false             |
| last_name_katakana     | string              | null: false             |
| birth_year             | integer             | null: false             |
| birth_month            | integer             | null: false             |
| birth_day              | integer             | null: false             |


### Association

- has_many :items
- has_many :comments



## items table

| Colum              | Type                | Options                 |
| ------------------ | ------------------- | ----------------------- |
| title              | string              | null: false             |
| explain            | text                | null: false             |
| category           | integer             | null: false             |
| state              | integer             | null: false             |
| delivery_fee       | integer             | null: false             |
| owner_region       | integer             | null: false             |
| delivery_date      | integer             | null: false             |
| price              | integer             | null: false             |
| user               | references          | foreign_key: true       |


### Association 

- has_many    :comments
- belongs_to  :user
- has_one     :buyer



## comments table

| Colum              | Type                | Options                 |
| ------------------ | ------------------- | ----------------------- |
| text               | text                | null: false             |
| user               | references          | foreign_key: true       |
| products           | references          | foreign_key: true       |


### Association

- belongs_to :user
- belongs_to :products



## buyers table 

| Colum              | Type                | Options                 |
| ------------------ | ------------------- | ----------------------- |
| user               | references          | foreign_key             |
| products           | references          | foreign_key             |


### Association

- belongs_to  :item
- has_one     :delivery_info




## delivery_info table

| Colum              | Type                | Options                 |
| ------------------ | ------------------- | ----------------------- |
| card_number        | string              | null: false             |
| effective_year     | string              | null: false             |
| effective_month    | string              | null: false             |
| card_security_code | string              | null: false             |
| postal_code        | string              | null: false             |
| prefecture         | integer             | null: false             |
| city               | string              | null: false             |
| address            | string              | null: false             |
| building           | string              |                         |
| phone_number       | string              | null: false             |


### Association

- belongs_to :buyer
- belongs_to :user
- belongs_to :item