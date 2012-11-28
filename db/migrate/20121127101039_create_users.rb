class CreateUsers < ActiveRecord::Migration

  def up
    create_table :users do |t|
      t.string :password
      t.boolean :is_admin, :null => false, :default => false
      t.timestamps
    end
  end

end
