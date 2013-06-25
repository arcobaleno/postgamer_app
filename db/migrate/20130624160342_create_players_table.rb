class CreatePlayersTable < ActiveRecord::Migration
  def change
  	 create_table "players", :force => true do |t|
	    t.integer "user_id"
	    t.integer "score_one"
	    t.integer "score_two"
	  end
  end
end
