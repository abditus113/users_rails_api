class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: :uuid do |t|
      t.string :name
      t.integer :age

      t.timestamps null: false
    end
  end
end
