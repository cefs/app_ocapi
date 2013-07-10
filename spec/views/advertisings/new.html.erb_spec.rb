require 'spec_helper'

describe "advertisings/new" do
  before(:each) do
    assign(:advertising, stub_model(Advertising,
      :title => "MyString",
      :description => "MyText",
      :status => "MyString",
      :user => nil
    ).as_new_record)
  end

  it "renders new advertising form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", advertisings_path, "post" do
      assert_select "input#advertising_title[name=?]", "advertising[title]"
      assert_select "textarea#advertising_description[name=?]", "advertising[description]"
      assert_select "input#advertising_status[name=?]", "advertising[status]"
      assert_select "input#advertising_user[name=?]", "advertising[user]"
    end
  end
end
