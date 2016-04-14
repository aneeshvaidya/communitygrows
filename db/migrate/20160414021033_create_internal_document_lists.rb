class CreateInternalDocumentLists < ActiveRecord::Migration
  def change
    create_table :internal_document_lists do |t|
      t.string :title
      t.string :url

      t.timestamps null: false
    end
  end
end
