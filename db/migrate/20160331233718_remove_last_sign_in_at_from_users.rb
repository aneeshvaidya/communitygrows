class RemoveLastSignInAtFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :last_sign_in_at, :datetime
    add_column :users, :last_sign_in_at, :datetime, :default => Time.now, :null => false
  end
end
