class AddAnnouncementToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :announcement, index: true, foreign_key: true
  end
end
