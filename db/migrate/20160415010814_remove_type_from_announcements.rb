class RemoveTypeFromAnnouncements < ActiveRecord::Migration
  def change
    remove_column :announcements, :type
    add_column :announcements, :committee_type, :string
  end
end
