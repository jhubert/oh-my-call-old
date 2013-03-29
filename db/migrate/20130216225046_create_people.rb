class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :phone_number, null: false
      t.string :fullname
      t.string :nickname
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
