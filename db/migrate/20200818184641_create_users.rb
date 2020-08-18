class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :email
      t.string :password_digest
      t.string :token

      t.timestamps
    end
  end
end
