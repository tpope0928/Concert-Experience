class ExperiencesController < ApplicationController
  def new
    #if it's nested and why find the post
    @concert = Concert.find_by_id(params[:concert_id])
    if @concert
      @experience = @concert.experiences.build
    else
      @experience = Experience.new
    end
  end

  def create
    @experience = current_user.experiences.build(experience_params)
    @experience.concert_id = params[:concert_id]
    
    if @experience.save
      redirect_to experience_path(@experience)
    else
      render :new
    end
  end

  def index
    @experiences = Experience.all
   # if @concert = Concert.find_by_id(params[:concert_id])
   #   @experiences = @concert.experiences
   # else
   #   @experiences = Experience.all
   # end
  end


  def show
    @experience = Experience.find_by_id(params[:id])
  end
    
      private
    
      def experience_params
        params.require(:experience).permit(:content, :rating, :concert_id)
      end

    end