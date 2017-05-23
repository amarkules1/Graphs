require_relative '../my_edge'
require_relative '../my_vertex'
require_relative '../my_graph'
require 'yaml'
require 'spec_helper'


describe MyEdge do
  before :each do
    @myedge = MyEdge.new "label", "value"
  end

  describe "#new" do
    it "returns a new edge object" do
      @myedge.should be_an_instance_of MyEdge
    end
    it "throws an argument error for more than two arguments" do
      lambda { MyEdge.new "label", "value", "xyz"}.should raise_exception ArgumentError
    end

  end
  describe "#label" do
    it "returns the correct label" do
      @myedge.label.should eql "label"
    end
  end
  describe "#value" do
    it "returns the correct value" do
      @myedge.value.should eql "value"
    end
  end
end