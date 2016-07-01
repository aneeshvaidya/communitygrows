class AddEndToEvents < ActiveRecord::Migration
  def change
    add_column :events, :end, :datetime
  end
end
