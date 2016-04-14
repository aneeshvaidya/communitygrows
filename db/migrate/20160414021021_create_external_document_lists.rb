class CreateExternalDocumentLists < ActiveRecord::Migration
  def change
    create_table :external_document_lists do |t|
      t.string :title
      t.string :url

      t.timestamps null: false
    end
  end
end
