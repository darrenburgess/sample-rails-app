class CreateComms < ActiveRecord::Migration
  def change
    create_table :comms do |t|
      t.string :contact_string
      t.string :method
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
