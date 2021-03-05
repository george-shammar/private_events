class DropTableInvitation < ActiveRecord::Migration[6.1]
  def change
    drop_table :invitations
  end
end
