class CreateIssues < ActiveRecord::Migration
  def self.up
    create_table :issues do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
	add_index :issues, :user_id
  end

  def self.down
    drop_table :issues
  end
end
