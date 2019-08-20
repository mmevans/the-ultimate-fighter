class AddPasswordToUsers < ActiveRecord::Migration[4.2]
    def change
        add_column :users, :password, :string
        add_column :users, :gender, :string
        add_column :users, :level, :integer
    end
end