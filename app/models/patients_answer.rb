class PatientsAnswer < ApplicationRecord
  belongs_to :answer
  belongs_to :assessment
  belongs_to :patient
end
