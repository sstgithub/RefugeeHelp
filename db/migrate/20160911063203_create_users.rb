class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.float :lat
      t.float :long
      t.string :user_type
      t.string :category_name
      t.boolean :current
      t.string :phone_num

      t.timestamps null: false
    end
  end
end
