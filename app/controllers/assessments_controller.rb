class AssessmentsController < ApplicationController
  def submit
    assessment = Assessment.new(assessment_params)

    if assessment.valid? && !(patients_answers.empty?)

      assessment.save
      patients_answers.each do |p_a|
        patient_answer = PatientsAnswer.create(
          patient_id: assessment.patient_id,
          assessment_id: assessment.id,
          answer_id: p_a
        )

        patient_answer.save
      end

      assessment.save_score
      render json: { assessment: assessment }, status: 201
    else
      render json: assessment.errors, status: :unprocessable_entity
    end

  end


  private

  def permitted_params
    params.require(:assessment).permit(
      :patient_id,
      :questionnaire_id,
      :assessment_name,
      :date,
      :assessment_group_id,
      patients_answers: [])
  end

  def assessment_params
    permitted_params.except("patients_answers")
  end

  def patients_answers
    permitted_params.slice("patients_answers").values.flatten
  end
end
