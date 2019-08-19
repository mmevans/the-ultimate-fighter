class CreateUsers < ActiveRecord::Migration[4.2]
    def change
        create_table :users do |t|
            t.string :username
            t.string :trainer_name
            t.integer :energy
            t.integer :money
            t.integer :flex
            t.integer :str
            t.integer :end
            t.integer :fights_won
            t.integer :weeks_trained
            t.boolean :injured
        end
    end
end