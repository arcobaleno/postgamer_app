class PlayersController < ApplicationController

	def index
		@players = Player.paginate(page: params[:page]).includes(:user)
	end

	def new
		@player = Player.new
	end

	def create
		@player = Player.new(params[:player])
		@user = User.find(current_user)
		@player_exist = Player.find_by_user_id(current_user)
		if @player.save
			flash[:success] = "Score Posted Successfully"
			redirect_to '/game'
		else
			if @player_exist != nil
				flash[:error] = "Already Posted Score, nice try!"
				redirect_to '/game'
			else
				flash[:error] = "Score not Posted, Please Try Again!"
				redirect_to '/game'
			end
		end
	end

	def show
		@player = Player.find(params[:id])
		@user = User.find_by_id(@player.user_id)
	end
end