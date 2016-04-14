class CreateExternalAnnouncements < ActiveRecord::Migration
  def change
    create_table :external_announcements do |t|
      t.string :title
      t.string :content

      t.timestamps null: false
    end
  end
end
