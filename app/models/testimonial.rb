class Testimonial < ActiveRecord::Base
    belongs_to :user
    validates :title, presence: true, length: {minimum: 3, maximum: 50}
    validates :description, presence: true, length: {minimum: 15, maximum: 3000}
end