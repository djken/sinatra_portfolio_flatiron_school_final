class CreateMeetings < ActiveRecord::Migration[5.2]
  def up
    create_table :meetings do |t|
      t.string :firstname
      t.string :lastname
      t.string :address
      t.string :phone_number
      t.string :schedule
      t.string :description

      t.integer :user_id
    end
  end

  def down
    drop_table :meetings
  end
end
