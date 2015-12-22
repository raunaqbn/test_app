class AddUserInformation < ActiveRecord::Migration
  def change
    add_column :testimonials, :username, :text
    add_column :testimonials, :email, :email_address
  end
end
