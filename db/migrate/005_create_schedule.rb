class CreateSchedule < ActiveRecord::Migration[4.2]
    def change
        create_table :schedules do |t|
            t.string :sleep
            t.string :job
            t.string :food
            t.string :workout
            t.string :relax
        end
    end
end