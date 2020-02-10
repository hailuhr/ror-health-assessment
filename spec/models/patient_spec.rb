require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe "database columns" do
    it { is_expected.to have_db_column(:date_of_birth) }
    it { is_expected.to have_db_column(:first_name) }
    it { is_expected.to have_db_column(:last_name) }
  end

  describe "associations" do
    it { should have_many :assessments }
    it { should have_many :patients_answers }
  end
end
