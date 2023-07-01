class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references   :user, null: false, foreign_key: true
      t.references   :item, null: false, foreign_key: true
      t.string       :card_number, null: false
      t.integer      :card_month, null: false
      t.integer      :card_year, null: false
      t.string       :security_code, null: false
      t.timestamps
    end
  end
end
