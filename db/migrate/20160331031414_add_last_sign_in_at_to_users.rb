class AddLastSignInAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :notification_email, :boolean, :default => true
    add_column :users, :last_sign_in_at, :datetime, :default => Time.now, :null => false
  end
end
