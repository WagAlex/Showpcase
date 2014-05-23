class AddUsersToShops < ActiveRecord::Migration
  def change

    add_reference  :shops, :user

  end

end