require 'spec_helper'

describe "associations/index.html.haml" do
  before(:each) do
    assign(:associations, [
      stub_model(Association),
      stub_model(Association)
    ])
  end

  it "renders a list of associations" do
    render
  end
end
