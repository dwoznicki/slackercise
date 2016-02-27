class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :points, default: 0
      t.string :username, null: false
      t.timestamps null: false
    end
  end
end
