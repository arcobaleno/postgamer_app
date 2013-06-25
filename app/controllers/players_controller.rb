class PlayersController < ApplicationController

	def index
		@players = Player.paginate(page: params[:page]).includes(:user)
	end

	def new
		@player = Player.new
	end

	def create
		@player = Player.new(params[:player])
		if @player.save
			flash[:success] = "Score Posted Successfully"
			redirect_to '/game'
		else
			flash[:error] = "Score not Posted, Please Try Again!"
			redirect_to '/game'
		end
	end

	def show
		@player = Player.find(params[:id])
		@user = User.find_by_id(@player.user_id)
	end
end