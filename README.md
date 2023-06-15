# テーブル設計 

## users テーブル 

| Column                  | Type   | Options     | 
| ----------------------- | ------ | ----------- | 
| nickname                | string | null: false | 
| email                   | string | null: false | 
| encrypted_password      | string | null: false | 
| firstname_zenkaku       | string | null: false | 
| lastname_zenkaku        | string | null: false | 
| firstname_kana_zenkaku  | string | null: false |
| lastname_kana_zenkaku   | string | null: false |
| birthday                | date   | null: false | 

### Association 

- has_many :items 
- has_many :orders
- has_one  :address

## items テーブル 

| Column          | Type       | Options                        | 
| ----------------| ---------- | ------------------------------ | 
| item_name       | string     | null: false                    | 
| price           | integer    | null: false                    |
| item_explain    | text       | null: false                    |
| category        | integer    | null: false                    |
| item_condition  | integer    | null: false                    |
| delivery_charge | integer    | null: false                    |
| sender_region   | integer    | null: false                    |
| until sendday   | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association 

- belongs_to :user
- has_one    :order

## orders テーブル 

| Column | Type       | Options                        | 
| -------| ---------- | ------------------------------ | 
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association 

- belong_to :item
- belong_to :user
- has_one   :address

## addresses テーブル

| Column           | Type       | Options                        | 
| -----------------| ---------- | ------------------------------ | 
| post_code        | string     | null: false                    | 
| prefecture       | integer    | null: false                    |
| municipality     | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |
| order_history    | references | null: false, foreign_key: true |

### Association 

- belong_to :order

