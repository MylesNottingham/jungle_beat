require "rspec"
require "./lib/node"

RSpec.describe Node do
  before(:each) do
    @node = Node.new("plop")
  end

  it "exists" do
    expect(@node).to be_an_instance_of(Node)
  end

  it "has readable attributes" do
    expect(@node.data).to eq("plop")
    expect(@node.next_node).to eq(nil)
  end
end