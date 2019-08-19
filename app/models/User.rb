class User < ActiveRecord::Base
    has_many :opponents, through: :fights
    has_many :moves
    has_one :schedules
    has_many :fights
    has_many :workouts
end