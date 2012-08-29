class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.text :password
      t.string :email
      t.text :address

      t.timestamps
    end
  end
end
