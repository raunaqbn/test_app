class AddDescriptionToTestimonials < ActiveRecord::Migration
  def up
    add_column :testimonials, :description, :text
    add_column :testimonials, :created_at, :datetime
    add_column :testimonials, :updated_at, :datetime
  end
  def change
    drop_table :articles
  end
end
