class CreateVotes < ActiveRecord::Migration
  def up
    create_table :votes do |t|
      t.references :user
      t.references :position
      t.references :candidate
      t.timestamps
    end
    add_index(:votes, [:user_id, :position_id], :unique => true)
  end
end
