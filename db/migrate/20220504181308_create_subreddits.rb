class CreateSubreddits < ActiveRecord::Migration[7.0]
  def change
    create_table :subreddits do |t|
      t.string :name
      t.text :sub_description

      t.timestamps
    end
  end
end
