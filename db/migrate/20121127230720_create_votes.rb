class CreateVotes < ActiveRecord::Migration
  def up
    create_table :votes do |t|
      t.references :user
      t.references :position
      t.integer :rank
      t.references :candidate
      t.timestamps
    end
    add_index(:votes, [:user_id, :position_id, :rank], :unique => true)
  end
end
