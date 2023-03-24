require "rspec"
require "./lib/node"
require "./lib/linked_list"

RSpec.describe LinkedList do
  before(:each) do
    @list = LinkedList.new
  end

  it "exists" do
    expect(@list).to be_an_instance_of(LinkedList)
  end

  it "begins without a head" do
    expect(@list.head).to eq(nil)
  end

  it "can create a node and append it to the linked list" do
    @list.append("doop")

    expect(@list.head.data).to eq("doop")
  end
end