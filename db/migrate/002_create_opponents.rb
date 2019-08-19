class CreateOpponents < ActiveRecord::Migration[4.2]
    def change
        create_table :opponents do |t|
            t.string :name
            t.string :gender
            t.integer :energy
            t.integer :str
            t.integer :flex
            t.integer :end
            t.integer :fights_won
        end
    end
end