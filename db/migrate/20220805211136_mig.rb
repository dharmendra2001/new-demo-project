class Mig < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :date, :string
    add_column :users, :inter, :string
    add_column :users, :first, :string
    add_column :users, :second, :string
    add_column :users, :third, :string

    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
