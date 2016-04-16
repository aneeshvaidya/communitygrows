class AddInternalAnnouncementToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :internal_announcement, index: true, foreign_key: true
  end
end
