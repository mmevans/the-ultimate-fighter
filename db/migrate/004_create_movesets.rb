class CreateMovesets < ActiveRecord::Migration[4.2]
    def change
        create_table :movesets do |t|
            t.integer :level
            t.string :moves
            t.integer :damage
            t.string :move_type
        end
    end
end