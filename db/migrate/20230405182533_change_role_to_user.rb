class ChangeRoleToUser < ActiveRecord::Migration[7.0]
  def change
    def up
      change_column :users, :role, :integer, default: 0, null: false
    end
  
    def down
      change_column :users, :role, :string, default: "client", null: false
    end
  end
end
