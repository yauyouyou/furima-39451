class AddFirstnameKanaZenkakuToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :firstname_kana_zenkaku, :string
  end
end
