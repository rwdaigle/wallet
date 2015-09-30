class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.string :recipient
      t.decimal :credit
      t.decimal :debit
      t.decimal :balance

      t.timestamps null: false
    end
  end
end
