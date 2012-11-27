class CreateCandidates < ActiveRecord::Migration
  def up
    create_table :candidates do |t|
      t.string :name
      t.references :election
    end
  end
end
