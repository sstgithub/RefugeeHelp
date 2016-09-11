class AddPhoneNumToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :phone_num, :string
  end
end
