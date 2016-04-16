class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title
      t.string :url
      t.datetime :updated_at
      t.string :committee

      t.timestamps null: false
    end
  end
end
