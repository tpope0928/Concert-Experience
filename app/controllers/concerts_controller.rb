class ConcertsController < ApplicationController

    def index
        @concerts = Concert.all
       # if params[:user_id]
       #     @concert = User.find(params[:user_id]).concerts
        #    flash.now[:danger] = "You haven't added any concerts yet!" if @concerts.empty?
        #end
    end

    def new
        @concerts = Concert.new
        @concerts.build_artist
        #@concerts.review.build
    end

    def create
       # byebug
        @concerts = Concert.new(concert_params)
        @concerts.user_id = session[:user_id]
        if @concerts.save
            redirect_to concerts_path(@concerts)
        else
            render :new 
        end
    end

    def show
        @concerts = Concert.find(params[:id])
    end

    private

    def concert_params
        params.require(:concert).permit(:venue, :city, :state, :date, :artist_id, artist_attributes: [:name, :genre])
    end
    
end
