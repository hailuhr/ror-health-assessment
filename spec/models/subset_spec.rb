require 'rails_helper'

RSpec.describe Subset, type: :model do
  describe "database columns" do
    it { is_expected.to have_db_column(:subset_text) }
  end

  describe "associations" do
    it { should have_many :questions }
  end
end
