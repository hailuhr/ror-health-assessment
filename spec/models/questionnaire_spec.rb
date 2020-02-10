require 'rails_helper'

RSpec.describe Questionnaire, type: :model do
  Rails.application.load_seed

  describe "database columns" do
    it { is_expected.to have_db_column(:name) }
  end

  describe "associations" do
    it { should have_many :assessments }
    it { should have_many :questions }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe "instance methods" do
    describe "questionnaire_type" do
      context "when the questionnaire is Patient Health Questionnaire" do
        let(:questionnaire) { Questionnaire.first }

        it "should return the PHQ" do
          expect(questionnaire.questionnaire_type).to eq("PHQ")
        end
      end

      context "when the questionnaire is Sheehan Disability Scale" do
        let(:questionnaire) { Questionnaire.second }

        it "should return the SDS" do
          expect(questionnaire.questionnaire_type).to eq("SDS")
        end
      end
    end
  end
end
