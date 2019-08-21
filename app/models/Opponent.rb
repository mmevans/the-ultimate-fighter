class Opponent < ActiveRecord::Base
    has_one :user, through: :fights
    has_many :moves
end