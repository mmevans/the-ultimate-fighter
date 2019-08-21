class Highscore < ActiveRecord::Base
    has_many :users
end