require_relative '../my_edge'
require_relative '../my_vertex'
require_relative '../my_graph'
require 'yaml'
require 'spec_helper'

describe "graph object" do
  before :all do
    vertices = [
        MyVertex.new,
        MyVertex.new,
        MyVertex.new,
        MyVertex.new,
        MyVertex.new
    ]
    File.open "vertices.yml", "w" do |f|
      f.write YAML::dump vertices
    end
    edges = [
        MyEdge.new,
        MyEdge.new,
        MyEdge.new,
        MyEdge.new,
        MyEdge.new
    ]
    File.open "edges.yml", "w" do |f|
      f.write YAML::dump edges
    end
    adj_mat = [[0,1,0,1,1,0],
               [1,0,1,0,0,0],
               [0,1,0,1,0,0],
               [1,0,1,0,1,0],
               [1,0,0,1,0,0],
               [0,0,0,0,0,0]
    ]
    File.open "adj_mat.yml", "w" do |f|
      f.write YAML::dump adj_mat
    end
  end
  before :each do
    @graph = MyGraph.new "label"
  end
    it "returns an instance of graph" do
      @graph.should be_an_instance_of MyGraph
    end
    it "throws an error for more than one argument" do
      lambda { MyGraph.new "label", "value"}.should raise_exception ArgumentError
    end
    it "adds verticies and increments the number of verticies" do
      @v = MyVertex.new
      @graph.new_vertex @v
      @graph.num_verticies.should eql 1
    end
    it "adds edges and increments the number of edges" do
      @v1 = MyVertex.new
      @graph.new_vertex @v1
      @v2 = MyVertex.new
      @graph.new_vertex @v2
      @e = MyEdge.new
      @e.set_id(@v1.id,@v2.id)
      @graph.new_edge @e
      @graph.num_edges.should eql 1
    end
    it "outputs a list of edges" do
      v1 = MyVertex.new
      v2 = MyVertex.new
      v3 = MyVertex.new
      e1 = MyEdge.new("a")
      e2 = MyEdge.new("b")
      e3 = MyEdge.new("c")
      e1.set_id(v1.id,v2.id)
      e2.set_id(v2.id,v3.id)
      e3.set_id(v1.id,v2.id)
      @graph.new_edge(e1)
      @graph.new_edge(e2)
      @graph.new_edge(e3)
      @graph.list_edges.should eql "a, b, c"
    end
  describe "label" do
    it "holds the correct label" do
      @graph.label.should eql "label"
    end
  end
end

