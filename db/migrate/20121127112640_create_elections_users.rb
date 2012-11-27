class CreateElectionsUsers < ActiveRecord::Migration
  def up
    create_table :elections_users do |t|
      t.references :election
      t.references :user
    end
    add_index(:elections_users, [:election_id, :user_id], :unique => true)
  end

  def down
  end
end
