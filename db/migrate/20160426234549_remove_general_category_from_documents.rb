class RemoveGeneralCategoryFromDocuments < ActiveRecord::Migration
  def change
    remove_column :documents, :general_category, :string
  end
end
