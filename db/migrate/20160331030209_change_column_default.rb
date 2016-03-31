class ChangeColumnDefault < ActiveRecord::Migration
  def change
    def up
      change_column_default :users, :last_sign_in_at, false
    end
  
    def down
      change_column :users, :last_sign_in_at
    end    
  end
end
