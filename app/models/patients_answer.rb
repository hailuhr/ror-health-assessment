class PatientsAnswer < ApplicationRecord
  belongs_to :answer
  belongs_to :patient
  belongs_to :assessment
end
