class RemoveLastSignInAtFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :last_sign_in_at, :datetime
  end
end
