require 'spec_helper'

describe Advertising do
  context "relationships" do
    it { should belong_to(:user) }
  end

  context "validations" do
    it { should validate_presence_of :description }
    it { should validate_presence_of :status }
    it { should validate_presence_of :title }
  end
end
