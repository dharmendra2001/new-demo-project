class AddCol < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :time, :string
    add_column :users, :admin_date, :string
    
  end
end
