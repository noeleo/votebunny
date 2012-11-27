class CreateCandidatesPositions < ActiveRecord::Migration
  def up
    create_table :candidates_positions do |t|
      t.references :candidate
      t.references :position
    end
    add_index(:candidates_positions, [:candidate_id, :position_id], :unique => true)
  end
end
