# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_18_191438) do

  create_table "answers", force: :cascade do |t|
    t.string "answer_text"
    t.string "value"
    t.integer "question_id"
  end

  create_table "assessment_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "assessments", force: :cascade do |t|
    t.integer "score"
    t.integer "patient_id"
    t.integer "questionnaire_id"
    t.string "assessment_name"
    t.datetime "date"
    t.string "notes"
    t.integer "assessment_group_id"
  end

  create_table "patients", force: :cascade do |t|
    t.datetime "date_of_birth"
    t.string "first_name"
    t.string "last_name"
  end

  create_table "patients_answers", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "answer_id"
    t.integer "assessment_id"
  end

  create_table "questionnaires", force: :cascade do |t|
    t.string "name"
    t.integer "assessment_id"
  end

  create_table "questions", force: :cascade do |t|
    t.boolean "active", default: true
    t.integer "subset_id"
    t.integer "questionnaire_id"
    t.string "question_type"
    t.string "question_text"
  end

  create_table "subsets", force: :cascade do |t|
    t.string "subset_text"
    t.integer "question_id"
  end

end
