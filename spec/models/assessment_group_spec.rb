require 'rails_helper'

RSpec.describe AssessmentGroup, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "database columns" do
    it { is_expected.to have_db_column(:name) }
  end

  describe "associations" do
    it { should have_many :assessments }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe "instance methods" do
    describe "check_high_risk" do
      let(:assessment_group) { AssessmentGroup.create(name: "test group") }
      let(:assessment) {  Assessment.create(questionnaire_id: 1, patient_id: 1, assessment_group_id: assessment_group.id, date: "1/1/2020", assessment_name: "testing") }

      it "should return true if an assessment has a score above 15" do
        assessment.update(score: 20)

        expect(assessment_group.check_high_risk).to eq(true)
      end

      it "should return false if an assessment has a score below 15" do
        assessment.update(score: 10)

        expect(assessment_group.check_high_risk).to eq(false)
      end

      it "should return false for unscored assessment groups" do
        assessment.update(score: nil)

        expect(assessment_group.check_high_risk).to eq(false)
      end
    end
  end
end
