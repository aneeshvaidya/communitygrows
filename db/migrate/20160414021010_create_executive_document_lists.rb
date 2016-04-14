class CreateExecutiveDocumentLists < ActiveRecord::Migration
  def change
    create_table :executive_document_lists do |t|
      t.string :title
      t.string :url

      t.timestamps null: false
    end
  end
end
