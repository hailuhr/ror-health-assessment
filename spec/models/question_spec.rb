require 'rails_helper'

RSpec.describe Question, type: :model do
  describe "database columns" do
    it { is_expected.to have_db_column(:active) }
    it { is_expected.to have_db_column(:question_text) }
    it { is_expected.to have_db_column(:question_type) }
  end

  describe "associations" do
    it { should have_many :answers }
    it { should belong_to :questionnaire }
    it { should belong_to :subset }
  end
end
