class CreateUsers < ActiveRecord::Migration

  def up
    create_table :users do |t|
      t.string :password
      t.boolean :is_admin
      t.timestamps
    end
  end

end
