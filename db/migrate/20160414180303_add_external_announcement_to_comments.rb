class AddExternalAnnouncementToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :external_announcement, index: true, foreign_key: true
  end
end
