class CreateCoords < ActiveRecord::Migration
  def change
    create_table :coords do |t|
      t.float :lat
      t.float :long

      t.timestamps null: false
    end
  end
end
