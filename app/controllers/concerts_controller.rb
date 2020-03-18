class ConcertsController < ApplicationController
    before_action :set_concert, only:[:show, :edit, :update]
    #before_action :authenticate_user!, :except => [:index]
    before_action :redirect_if_not_logged_in

    def index
        @concerts = Concert.concert_date
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

    def edit
        @concert = Concert.find(params[:id])
    end

    def update
        @concert = Concert.find(params[:id])
        @concert.update(params.require(:concert).permit(:venue, :city, :state, :date, :artist_id, artist_attributes: [:name, :genre]))
        redirect_to concerts_path(@concerts)
    end

    def destroy
        @concert = Concert.find(params[:id])
        @concert.destroy
        flash[:danger] = "Concert was successfully deleted"
        redirect_to concerts_path(@concerts)
    end


    private

    def concert_params
        params.require(:concert).permit(:venue, :city, :state, :date, :artist_id, artist_attributes: [:name, :genre])
    end

    def date
    end

    def set_concert
        @concert = Concert.find_by(params[:id])
        redirect_to concerts_path if !@concert
    end

end
