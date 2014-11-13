class CreateBannedUsers < ActiveRecord::Migration
  def change
    create_table :banned_users do |t|

      t.timestamps
    end
  end
end
