class Testimonial < ActiveRecord::Base
    validates :title, presence: true, length: {minimum: 3, maximum: 50}
    validates :description, presence: true, length: {minimum: 15, maximum: 300}
    validates :username, presence: true, length: {minimum: 3, maximum: 50}
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end