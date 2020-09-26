class AddCatererSettingsAndZip < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :caterer_business_name, :string
    add_column :users, :caterer_business_address, :string
    add_column :users, :caterer_business_city, :string
    add_column :users, :caterer_business_state, :string
    add_column :users, :zip_code, :integer
  end
end
