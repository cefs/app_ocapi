require 'spec_helper'

describe "advertisings/index" do
  before(:each) do
    assign(:advertisings, [
      stub_model(Advertising,
        :title => "Title",
        :description => "MyText",
        :status => "Status",
        :user => nil
      ),
      stub_model(Advertising,
        :title => "Title",
        :description => "MyText",
        :status => "Status",
        :user => nil
      )
    ])
  end

  it "renders a list of advertisings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
