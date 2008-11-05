class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.boolean :blocked
      t.boolean :approved
      t.boolean :admin

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
