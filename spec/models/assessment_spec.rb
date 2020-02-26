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
    let(:assessment_group) { AssessmentGroup.create(name: "test group") }

    describe "save_score" do
      context "return true when called" do
        subject {  Assessment.create(questionnaire_id: 1, patient_id: 1, assessment_group_id: assessment_group.id, date: "1/1/2020", assessment_name: "testing") }

        its(:save_score) { is_expected.to eq(true) }
      end
    end

    describe "high_risk?" do
      context "return true when score is higher than 15" do
        subject {  Assessment.create(questionnaire_id: 1, patient_id: 1, assessment_group_id: assessment_group.id, date: "1/1/2020", assessment_name: "testing", score: 100) }

        its(:high_risk?) { is_expected.to eq(true) }
      end

      context "return false when score is lower than 15" do
        subject {  Assessment.create(questionnaire_id: 1, patient_id: 1, assessment_group_id: assessment_group.id, date: "1/1/2020", assessment_name: "testing", score: 2) }

        its(:high_risk?) { is_expected.to eq(false) }
      end

      context "return nil when score is nil" do
        subject {  Assessment.create(questionnaire_id: 1, patient_id: 1, assessment_group_id: assessment_group.id, date: "1/1/2020", assessment_name: "testing", score: nil) }

        its(:high_risk?) { is_expected.to eq(nil) }
      end
    end
  end
end
