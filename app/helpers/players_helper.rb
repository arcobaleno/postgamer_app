module PlayersHelper
 
	def player_exist
		@user = User.find(current_user)
		@player_exist = Player.find_by_user_id(current_user)
		if @player_exist == nil
			render 'shared/new_player'
		else
			render 'shared/player_score'
		end
	end
end