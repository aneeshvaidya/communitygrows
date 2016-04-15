class RemoveTypeFromDocuments < ActiveRecord::Migration
  def change
    remove_column :documents, :type
    add_column :documents, :committee_type, :string
  end
end
