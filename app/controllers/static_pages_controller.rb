class StaticPagesController < ApplicationController
  
  def home
  end

  def game
  	@players = Player.paginate(page: params[:page]).includes(:user)
  	@player = Player.new
  	@microposts = Micropost.paginate(page: params[:page]).includes(:user)
  	@micropost = Micropost.new
  end

end
