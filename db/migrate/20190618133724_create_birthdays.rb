class CreateBirthdays < ActiveRecord::Migration[5.2]
  def change
    create_table :birthdays do |t|
      t.string :firstname
      t.string :lastname
      t.string :birthday
      t.string :phone_number
      t.string :relationship

      t.integer :user_id
    end
  end
end