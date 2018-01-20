class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |table|
      table.string :location, null: false
      table.string :name, null: false
      table.string :creator, null: false
      table.string :description, null: false

      table.timestamps null: false
    end

    # add_index :users, [:uid, :provider], unique: true
  end
end
