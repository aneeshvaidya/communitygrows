class AddCommitteeTypeToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :committee_type, :string
  end
end
