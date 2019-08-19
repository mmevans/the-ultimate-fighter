# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 8) do

  create_table "fights", force: :cascade do |t|
    t.string "users"
    t.string "opponents"
    t.string "city"
  end

  create_table "highscores", force: :cascade do |t|
    t.string "username"
    t.datetime "date"
    t.integer "highscore"
  end

  create_table "movesets", force: :cascade do |t|
    t.string "str_moves"
    t.string "flex_moves"
    t.string "end_moves"
    t.string "power_moves"
  end

  create_table "opponents", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.integer "energy"
    t.integer "str"
    t.integer "flex"
    t.integer "end"
    t.integer "fights_won"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "sleep"
    t.string "job"
    t.string "food"
    t.string "workout"
    t.string "relax"
  end

  create_table "trainers", force: :cascade do |t|
    t.string "name"
    t.text "phrase1"
    t.text "phrase2"
    t.text "phrase3"
    t.text "phrase4"
    t.text "phrase5"
    t.text "phrase6"
    t.text "phrase7"
    t.text "phrase8"
    t.text "phrase9"
    t.text "phrase10"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "trainer_name"
    t.integer "energy"
    t.integer "money"
    t.integer "flex"
    t.integer "str"
    t.integer "end"
    t.integer "fights_won"
    t.integer "weeks_trained"
    t.boolean "injured"
  end

  create_table "workouts", force: :cascade do |t|
    t.string "str_workouts"
    t.string "flex_workouts"
    t.string "end_workouts"
  end

end
