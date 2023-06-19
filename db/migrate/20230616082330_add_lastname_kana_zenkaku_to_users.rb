class AddLastnameKanaZenkakuToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :lastname_kana_zenkaku, :string
  end
end
