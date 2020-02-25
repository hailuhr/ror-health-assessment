require 'rails_helper'

RSpec.describe "Assessments", type: :request do
  Rails.application.load_seed

  let(:patient) { Patient.create(first_name: "Testing", last_name: "Testerson", date_of_birth: "1/1/2011") }
  let(:assessment) {  Assessment.create(questionnaire_id: 1, patient_id: 1, assessment_group_id: 1, date: "1/1/2020", assessment_name: "testing") }
  let(:patients_answers) { Assessment.first.patients_answers.map{ |i| i.answer_id } }

  let(:valid_assessment_params) {
    {
      assessment: {
        patient_id: patient.id,
        questionnaire_id: Questionnaire.first.id,
        assessment_name: "test assessment",
        patients_answers: patients_answers,
        date: "01/01/2011"
      }
    }
  }
  let(:invalid_assessment_params) {
    {
      assessment: {
        questionnaire_id: Questionnaire.first.id,
        patients_answers: patients_answers,
        patients_answers: patients_answers
      }
    }
  }
  let(:params_without_answers) {
    {
      assessment: {
        patient_id: patient.id,
        questionnaire_id: Questionnaire.first.id,
        patients_answers: []
      }
    }
  }


  describe "POST submit assessment" do
    describe "with valid params" do
      it "creates a new Assessment and success codes" do
        post assessments_path({params: valid_assessment_params})
        expect(response).to have_http_status(:success)
      end

      it "creates a new Assessment" do
        expect {
          post assessments_path({params: valid_assessment_params})
        }.to change(Assessment, :count).by(1)
        expect(Assessment.last.assessment_name).to eq(valid_assessment_params[:assessment][:assessment_name])
      end
    end

    describe "with invalid params" do
      it "returns an unprocessable_entity error" do
        post assessments_path({params: invalid_assessment_params})
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "does not create a new Assessment" do
          expect {
          post assessments_path({params: invalid_assessment_params})
        }.to change(Assessment, :count).by(0)
      end
    end

    describe "with empty assessment answers" do
      it "returns an unprocessable_entity error" do
        post assessments_path({params: params_without_answers})
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "does not create a new Assessment" do
          expect {
          post assessments_path({params: params_without_answers})
        }.to change(Assessment, :count).by(0)
      end
    end
  end
end
