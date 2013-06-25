class CreateUsersTable < ActiveRecord::Migration
  def change
	  create_table "users", :force => true do |t|
	    t.string   "first_name"
	    t.string   "last_name"
	    t.string   "email"
	    t.string   "password_digest"
	    t.string   "remember_token"
	    t.boolean  "admin",           :default => false
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.integer  "user_type"
	    t.string   "avatar"
	    t.string   "cellphone"
	  end
  end
end
