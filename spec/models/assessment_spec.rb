require 'rails_helper'

RSpec.describe Assessment, type: :model do
  Rails.application.load_seed

  describe "database columns" do
    it { is_expected.to have_db_column(:assessment_name) }
    it { is_expected.to have_db_column(:date) }
    it { is_expected.to have_db_column(:notes) }
    it { is_expected.to have_db_column(:patient_id) }
    it { is_expected.to have_db_column(:questionnaire_id) }
    it { is_expected.to have_db_column(:score) }
  end

  describe "associations" do
    it { should belong_to :patient }
    it { should belong_to :questionnaire }
  end

  describe "validations" do
    it { should validate_presence_of(:assessment_name) }
  end

  describe "instance methods" do
    describe "save_score" do
      let(:assessment) {  Assessment.create(questionnaire_id: 1, patient_id: 1, assessment_group_id: 1, date: "1/1/2020", assessment_name: "testing") }
      let(:score) { 20 }

      it "return true after being called" do
        assessment.score = score
        assessment.save_score

        expect(assessment.save_score).to eq(true)
        expect(assessment.score).to eq(30)
      end
    end
  end
end
