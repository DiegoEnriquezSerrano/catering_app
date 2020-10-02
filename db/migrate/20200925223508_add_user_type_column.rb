class AddUserTypeColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :caterer_user, :boolean
  end
end
