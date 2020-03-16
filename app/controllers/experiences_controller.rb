class ExperiencesController < ApplicationController

  before_action :redirect_if_not_logged_in

  def new
    #if it's nested and why find the post
    @concert = Concert.find_by_id(params[:concert_id])
    @experience = Experience.new
  end

  def create
    @experience = current_user.experiences.build(experience_params)
    @experience.concert_id = params[:concert_id]
    
    if @experience.save
      redirect_to concert_experiences_path(@experience)
    else
      render :new
    end
  end

  def index
    if @concert = Concert.find_by_id(params[:concert_id])
      @experiences = @concert.experiences.concert_rating
    else
      @experiences = Experience.concert_rating
    end
  end


  def show
    @experience = Experience.find_by_id(params[:id])
  end

  def destroy
    @experience = Experience.find(params[:id])
    @experience.destroy
    flash[:danger] = "Experience was successfully deleted"
    redirect_to concert_experiences_path(@experience)
  end
    
      private
    
      def experience_params
        params.require(:experience).permit(:content, :rating, :concert_id)
      end

end