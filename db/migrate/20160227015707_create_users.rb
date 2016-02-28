class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :points, default: 0
      t.string :team_id
      t.string :name, null: false
      t.string :real_name
      t.string :first_name
      t.string :last_name
      t.string :image
      t.string :email

      t.timestamps null: false
    end
  end
end
