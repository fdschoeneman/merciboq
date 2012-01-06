require 'spec_helper'

describe "associations/edit.html.haml" do
  before(:each) do
    @association = assign(:association, stub_model(Association))
  end

  it "renders the edit association form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => associations_path(@association), :method => "post" do
    end
  end
end
