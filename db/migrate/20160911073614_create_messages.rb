class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.float :lat
      t.float :long
      t.string :user_type
      t.string :category_name

      t.timestamps null: false
    end
  end
end
