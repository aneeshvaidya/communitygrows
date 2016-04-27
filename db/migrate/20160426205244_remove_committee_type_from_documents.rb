class RemoveCommitteeTypeFromDocuments < ActiveRecord::Migration
  def change
    remove_column :documents, :committee_type, :string
  end
end
