require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe "database columns" do
    it { is_expected.to have_db_column(:answer_text) }
    it { is_expected.to have_db_column(:value) }
  end

  describe "associations" do
    it { should belong_to :question }
    it { should have_many :patients_answers }
  end
end
