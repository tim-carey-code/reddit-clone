class DropSubscribersTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :subscribers
  end
end
