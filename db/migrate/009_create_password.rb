class CreatePasswords < ActiveRecord::Migration[4.2]
    def change
        add_column :users, :passwords, :string
    end
end