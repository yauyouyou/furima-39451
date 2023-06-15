# テーブル設計 

## users テーブル 

| Column   | Type   | Options     | 
| -------- | ------ | ----------- | 
| nickname | string | null: false | 
| email    | string | null: false | 
| password | string | null: false | 

### Association 

- has_many :items 
- has_many :buys 

## items テーブル 

| Column    | Type    | Options     | 
| ----------| ------  | ----------- | 
| itemname  | string  | null: false | 
| category  | string  | null: false | 
| brand     | string  | null: false | 
| price     | integer | null: false | 
| seller    | string  | null: false | 

### Association 

- belongs_to :users 
- belongs_to :buys 

## buys テーブル 

| Column         | Type   | Options     | 
| ---------------| ------ | ----------- | 
| buyer          | string | null: false | 
| delivery       | text   | null: false | 

### Association 

- has_many :items 
- belongs_to :users 