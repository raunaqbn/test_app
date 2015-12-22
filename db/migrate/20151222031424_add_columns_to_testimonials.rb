class AddColumnsToTestimonials < ActiveRecord::Migration
  def change
    add_column :testimonials, :description, :text
    add_column :testimonials, :created_at, :datetime
    add_column :testimonials, :updated_at, :datetime
    add_column :testimonials, :username, :text
    add_column :testimonials, :email, :email_address
  end
end
