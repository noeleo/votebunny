class CreatePositions < ActiveRecord::Migration
  def up
    create_table :positions do |t|
      t.string :title
      t.references :election
    end
  end
end
