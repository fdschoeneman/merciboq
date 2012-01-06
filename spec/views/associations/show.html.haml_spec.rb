require 'spec_helper'

describe "associations/show.html.haml" do
  before(:each) do
    @association = assign(:association, stub_model(Association))
  end

  it "renders attributes in <p>" do
    render
  end
end
