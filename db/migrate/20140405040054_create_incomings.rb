class CreateIncomings < ActiveRecord::Migration
  def change
    create_table :incomings do |t|
      t.string :subject
      t.string :'body-plain'
      t.string :from

      t.timestamps
    end
  end
end
