require 'rails_helper'

RSpec.describe PatientsAnswer, type: :model do
  describe "database columns" do
    it { is_expected.to have_db_column(:answer_id) }
    it { is_expected.to have_db_column(:assessment_id) }
    it { is_expected.to have_db_column(:patient_id) }
  end

  describe "associations" do
    it { should belong_to :answer }
    it { should belong_to :assessment }
    it { should belong_to :patient }
  end
end
