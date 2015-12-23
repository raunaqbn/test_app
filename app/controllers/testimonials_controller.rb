class TestimonialsController < ApplicationController
  def index
     @testimonials = Testimonial.all
  end
  
  def new
      @testimonial = Testimonial.new
  end
  def create
      #render plain: params{:testimonial}.inspect
      @testimonial = Testimonial.new(testimonial_params)
      if @testimonial.save
        flash[:success] = "Testimonial was successfully saved/posted"
        redirect_to testimonial_path(@testimonial)
      else
          render 'new'
      end
          
  end
  def show
      @testimonial = Testimonial.find(params[:id])
  end

  def edit
      @testimonial = Testimonial.find(params[:id])    
  end
  
  def update
      @testimonial = Testimonial.find(params[:id])
      if @testimonial.update(testimonial_params)
          flash[:success] = "Testimonial was successfully updated"
          redirect_to testimonial_path(@testimonial)
      else
          render 'edit'
      end
  end
  def destroy
     @testimonial = Testimonial.find(params[:id]) 
     if @testimonial.destroy
         flash[:success] = "Your testimonial was successfully delted"
         redirect_to testimonials_path
     else
         flash[:warning] = "Could not delete testimonial"
         render 'show'
     end
     
  end
  private
    def testimonial_params
      params.require(:testimonial).permit(:title, :username, :email, :description)
    end
end

