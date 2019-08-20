class CreateMovesets < ActiveRecord::Migration[4.2]
    def change
        create_table :movesets do |t|
            t.integer :level
            t.string :str_moves
            t.integer :str_damage
            t.string :flex_moves
            t.integer :flex_damage
            t.string :end_moves
            t.integer :end_damage
            t.string :power_moves
            t.integer :power_damage
        end
    end
end