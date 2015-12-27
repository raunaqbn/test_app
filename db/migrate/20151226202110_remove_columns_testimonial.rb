class RemoveColumnsTestimonial < ActiveRecord::Migration
  def change
    remove_column :testimonials, :username
    remove_column :testimonials, :email
  end
end
