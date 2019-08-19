class CreateTrainers < ActiveRecord::Migration[4.2]
    def change
        create_table :trainers do |t|
            t.string :name
            t.text :phrase1
            t.text :phrase2
            t.text :phrase3
            t.text :phrase4
            t.text :phrase5
            t.text :phrase6
            t.text :phrase7
            t.text :phrase8
            t.text :phrase9
            t.text :phrase10
        end
    end
end