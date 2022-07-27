class DropTableSubRelations < ActiveRecord::Migration[7.0]
  def change
    drop_table :sub_relations
  end
end
