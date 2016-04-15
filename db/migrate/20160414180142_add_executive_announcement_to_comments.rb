class AddExecutiveAnnouncementToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :executive_announcement, index: true, foreign_key: true
  end
end
