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
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:assessment_name) }
  end

  describe "instance methods" do
    describe "save_score" do
      let(:assessment) { Assessment.first }

      it "should set the private_store_id to the passed private store" do
        assessment.score = nil
        expect(assessment.save_score).to eq(true)
        expect(assessment.score).to eq(30)
      end
    end
  end
end
