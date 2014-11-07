class AddPhoneNumbersToLostReport < ActiveRecord::Migration
  def change
    add_column :lost_reports, :phone_numbers, :text
    remove_column :lost_reports, :phone_number1
    remove_column :lost_reports, :phone_number2
  end
end
