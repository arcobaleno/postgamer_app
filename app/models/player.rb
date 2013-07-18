class Player < ActiveRecord::Base
  attr_accessible :user_id, :score_one, :score_two
  belongs_to :user

  validates_uniqueness_of :user_id
end

