class TestimonialsController < ApplicationController
  def new
      @testimonial = Testimonial.new
  end
  def create
      #render plain: params{:testimonial}.inspect
      @testimonial = Testimonial.new(testimonial_params)
      if @testimonial.save
        flash[:notice] = "Testimonial was successfully saved/posted"
        redirect_to testimonial_path(@testimonial)
      else
          render 'new'
      end
          
  end
  def show
      @testimonial = Testimonial.find(params[:id])
  end

  private
    def testimonial_params
      params.require(:testimonial).permit(:title, :username, :email, :description)
    end
end

