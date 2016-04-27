class AddGeneralCategoryToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :general_category, :string
  end
end
