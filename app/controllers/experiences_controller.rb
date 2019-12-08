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
      redirect_to concert_experiences_path
    else
      render :new
    end
  end
    
      private
    
      def experience_params
        params.require(:experience).permit(:content, :rating, :concert_id)
      end

    end