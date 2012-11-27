class CreateElections < ActiveRecord::Migration
  def up
    create_table :elections do |t|
      t.string :title
      t.timestamps
    end
  end
end
