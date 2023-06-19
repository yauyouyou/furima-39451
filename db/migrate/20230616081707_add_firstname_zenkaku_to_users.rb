class AddFirstnameZenkakuToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :firstname_zenkaku, :string
  end
end
