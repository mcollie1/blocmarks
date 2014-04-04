class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.boolean :public, default: true

      t.timestamps
    end
  end
end
