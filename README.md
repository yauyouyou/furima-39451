# テーブル設計 

## users テーブル 

| Column         | Type   | Options     | 
| -------------- | ------ | ----------- | 
| nickname       | string | null: false | 
| email          | string | null: false | 
| password       | string | null: false | 
| name           | string | null: false | 
| name_kana      | string | null: false | 
| date_of_birth  | string | null: false | 


### Association 

- has_many :items 
- has_many :orders
- has_one  :addresses

## items テーブル 

| Column      | Type    | Options     | 
| ------------| ------  | ----------- | 
| item_name   | string  | null: false | 
| category    | string  | null: false | 
| brand       | string  | null: false | 
| price       | integer | null: false | 
| seller      | string  | null: false | 
| item_image  | text    | null: false |
| item_detail | text    | null: false |
| caution     | text    | null: false |

### Association 

- belongs_to :users 
- has_one    :orders
- has_one    :addresses

## orders テーブル 

| Column        | Type    | Options     | 
| --------------| ------- | ----------- | 
| buyer         | string  | null: false | 
| delivery      | text    | null: false | 
| order_content | text    | null: false | 
| payment       | integer | null: false | 

### Association 

- belong_to :items 
- belong_to :users 
- has_one   :addresses

## addresses テーブル

| Column           | Type    | Options     | 
| -----------------| ------- | ----------- | 
| post_code        | string  | null: false | 
| prefecture       | string  | null: false |
| municipality     | string  | null: false |
| address          | string  | null: false |
| building_name    | string  | null: false |
| telephone_number | integer | null: false |

### Association 

- belong_to :items 
- belong_to :users
- belong_to :orders

