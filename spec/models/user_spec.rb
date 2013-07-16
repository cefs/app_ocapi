require 'spec_helper'

describe User do
  context "default values" do
    it "uses visitor as default for status" do
      expect(subject.role).to eq('visitor')
    end
  end

  context "relationships" do
    it { should have_many(:anuncios).dependent(:restrict) }
  end

  context "validations" do
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
  end
end
