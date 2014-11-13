class CreateGroupBannedUsers < ActiveRecord::Migration
  def change
    create_table :group_banned_users do |t|

      t.timestamps
    end
  end
end
