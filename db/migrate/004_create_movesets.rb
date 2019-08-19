class CreateMovesets < ActiveRecord::Migration[4.2]
    def change
        create_table :movesets do |t|
            t.string :str_moves
            t.string :flex_moves
            t.string :end_moves
            t.string :power_moves
        end
    end
end