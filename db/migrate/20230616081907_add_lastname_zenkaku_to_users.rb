class AddLastnameZenkakuToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :lastname_zenkaku, :string
  end
end
