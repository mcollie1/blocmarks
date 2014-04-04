class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.text :url
      t.references :topic, index: true

      t.timestamps
    end
  end
end
