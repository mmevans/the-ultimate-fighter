class CreateHighscores < ActiveRecord::Migration[4.2]
    def change
        create_table :highscores do |t|
            t.string :username
            t.datetime :date
            t.integer :highscore
        end
    end
end