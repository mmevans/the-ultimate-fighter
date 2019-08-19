class CreateFights < ActiveRecord::Migration[4.2]
    def change
        create_table :fights do |t|
            t.string :users
            t.string :opponents
            t.string :city
        end
    end
end