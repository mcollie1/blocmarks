class AddUrlToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :url_id, :integer
    add_index :votes, :url_id
  end
end
