class Fight < ActiveRecord::Base
    has_many :moves
    has_one :user, through: :fights
end