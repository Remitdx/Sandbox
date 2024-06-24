# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_06_24_102835) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: :cascade do |t|
    t.string "type"
    t.bigint "unit_id"
    t.bigint "tile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tile_id"], name: "index_actions_on_tile_id"
    t.index ["unit_id"], name: "index_actions_on_unit_id"
  end

  create_table "dices", force: :cascade do |t|
    t.integer "value"
    t.integer "faces"
    t.boolean "locked"
    t.string "color"
    t.bigint "action_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_id"], name: "index_dices_on_action_id"
  end

  create_table "maps", force: :cascade do |t|
    t.string "weather"
    t.integer "maxplayer"
    t.integer "size"
    t.integer "lines"
    t.integer "columns"
    t.bigint "risk_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["risk_id"], name: "index_maps_on_risk_id"
  end

  create_table "morbacs", force: :cascade do |t|
    t.integer "value", default: [5, 5, 5, 5, 5, 5, 5, 5, 5], array: true
    t.integer "gameover", default: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "pseudo"
    t.bigint "risk_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["risk_id"], name: "index_players_on_risk_id"
  end

  create_table "puissance4s", force: :cascade do |t|
    t.integer "gameover"
    t.integer "grid", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "risks", force: :cascade do |t|
    t.integer "mode"
    t.integer "complexity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roll_dices", force: :cascade do |t|
    t.integer "value"
    t.integer "faces"
    t.string "color"
    t.bigint "roll_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["roll_id"], name: "index_roll_dices_on_roll_id"
  end

  create_table "rolls", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tiles", force: :cascade do |t|
    t.string "field"
    t.boolean "built"
    t.string "resource"
    t.integer "x"
    t.integer "y"
    t.bigint "map_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["map_id"], name: "index_tiles_on_map_id"
  end

  create_table "units", force: :cascade do |t|
    t.integer "attack"
    t.integer "health"
    t.integer "crit"
    t.integer "moral"
    t.bigint "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_units_on_player_id"
  end

end
