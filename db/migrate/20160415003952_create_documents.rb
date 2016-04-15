class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :url
      t.string :title
      t.datetime :created_at
      t.datetime :updated_at
      t.string :type

      t.timestamps null: false
    end
  end
end
