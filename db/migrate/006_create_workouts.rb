class CreateWorkouts < ActiveRecord::Migration[4.2]
    def change
        create_table :workouts do |t|
            t.string :str_workouts
            t.string :flex_workouts
            t.string :end_workouts
        end
    end
end