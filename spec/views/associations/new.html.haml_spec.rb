require 'spec_helper'

describe "associations/new.html.haml" do
  before(:each) do
    assign(:association, stub_model(Association).as_new_record)
  end

  it "renders new association form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => associations_path, :method => "post" do
    end
  end
end
