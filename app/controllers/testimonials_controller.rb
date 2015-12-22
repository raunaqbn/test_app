class TestimonialsController < ApplicationController
  def new
      @testimonial = Testimonial.new
  end
  def create
      #render plain: params{:testimonial}.inspect
      @testimonial = Testimonial.new(testimonial_params)
      @testimonial.save
      redirect_to testimonial_show(@testimonial)
  end

  private
    def testimonial_params
      params.require(:testimonial).permit(:title, :username, :email, :description)
    end
end

