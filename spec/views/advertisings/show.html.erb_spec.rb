require 'spec_helper'

describe "advertisings/show" do
  before(:each) do
    @advertising = assign(:advertising, stub_model(Advertising,
      :title => "Title",
      :description => "MyText",
      :status => "Status",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/Status/)
    rendered.should match(//)
  end
end
