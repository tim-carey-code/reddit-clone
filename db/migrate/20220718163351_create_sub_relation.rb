class CreateSubRelation < ActiveRecord::Migration[7.0]
  def change
    create_table :sub_relations do |t|
      t.references :subscription, polymorphic: true
      t.references :subscriber, polymorphic: true
      t.timestamps
    end

    add_index :sub_relations,
      [:subscriber_id, :subscriber_type, :subscription_id, :subscription_type],
      unique: true,
      name: "composite_subscribable_index"
  end
end
