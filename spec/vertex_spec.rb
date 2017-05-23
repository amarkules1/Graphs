require_relative '../my_edge'
require_relative '../my_vertex'
require_relative '../my_graph'
require 'yaml'
require 'spec_helper'


  describe MyVertex do
    before :each do
      @myvertex = MyVertex.new "label", "value"
    end

    describe "#new" do
      it "returns a new vertex object" do
        @myvertex.should be_an_instance_of MyVertex
      end
      it "throws an argument error for more than two arguments" do
        lambda { MyVertex.new "label", "value", "xyz"}.should raise_exception ArgumentError
      end

    end
    describe "#label" do
      it "returns the correct label" do
        @myvertex.label.should eql "label"
      end
    end
    describe "#value" do
      it "returns the correct value" do
        @myvertex.value.should eql "value"
      end
    end
  end