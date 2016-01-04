class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.text :account_name
      t.decimal :balance, :precision => 10, :scale => 2
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
