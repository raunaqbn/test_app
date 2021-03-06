class TestimonialsController < ApplicationController
  
  before_action :set_testimonial, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    @testimonials = Testimonial.paginate(page: params[:page], per_page: 5)
  end
  
  def new
      @testimonial = Testimonial.new
  end
  def create
      #render plain: params{:testimonial}.inspect
      @testimonial = Testimonial.new(testimonial_params)
      @testimonial.user = current_user
      if @testimonial.save
        flash[:success] = "Testimonial was successfully saved/posted"
        redirect_to testimonial_path(@testimonial)
      else
          render 'new'
      end
          
  end
  def show
  end

  def edit
  end
  
  def update
      if @testimonial.update(testimonial_params)
          flash[:success] = "Testimonial was successfully updated"
          redirect_to testimonial_path(@testimonial)
      else
          render 'edit'
      end
  end
  def destroy
     if @testimonial.destroy
         flash[:success] = "Your testimonial was successfully delted"
         redirect_to testimonials_path
     else
         flash[:warning] = "Could not delete testimonial"
         render 'show'
     end
  end
  
  def set_testimonial
    @testimonial = Testimonial.find(params[:id])
  end
  
  def require_same_user
    if current_user != @testimonial.user and !current_user.admin?
      flash[:danger] = "You can only edit or delete your own testimonial"
      redirect_to root_path
    end
  end

  private
    def testimonial_params
      params.require(:testimonial).permit(:title, :description)
    end
end

