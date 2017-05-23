require_relative 'my_edge'
require_relative 'my_vertex'
class MyGraph
  attr_accessor :label, :vertexes, :edges, :adj_mat
  def initialize label=nil
    @label = label
    @adj_mat = []
    @vertexes = []
    @edges = []
  end
  def new_vertex v
    @vertexes.push v
    @arr = [0]
    v.id = adj_mat.length
    @adj_mat.each do |row|
      @arr.push 0
      row.push 0
    end
    @adj_mat.push @arr
    return v
  end
  def num_verticies
    return @adj_mat.length
  end
  def new_edge e
    @edges.push e
    @arr = e.get_id
    v1 = @arr[0]
    v2 = @arr[1]
    @adj_mat[v1.to_i][v2.to_i] = 1
    @adj_mat[v2.to_i][v1.to_i] = 1
    end

  def list_edges
    for i in @edges do
      puts @edges[i].label + ', '
    end
  end
  def list_verticies
    for i in @edges do
      puts @vertexes[i].label + ", "
    end
  end
  def vertex vert
    return vert
  end
  def num_edges
    return @edges.length
  end
  def num_vertex
    return @vertexes.length
  end
  def deg_vertex vertex
    int degree = 0
    int i = 0
    for i in vertexes do
      if vertexes[i] == vertex
        adjlist = @adj_mat[i]
        for i in adjlist do
          if adjlist[i] ==1
            degree += 1
          end
      end
      end
    end
  return degree
  end
  def incident_edges vertex
    edges[] = []
    for i in @edges do
      edge = @edges[i]
      if(edge.get_id[0]==vertex.id||edge.get_id[1]==vertex.id)
        edges.push[edge]
      end
    end
    return edges
  end
  def adjacent_vertices vertex
    arr[] = @adj_mat[vertex.id]
    vertices[] = []
    for i in arr do
      if(arr[i]==1)
        vertices.push(@vertexes[i])
      end
    end
    return vertices
  end
  def end_vertices edge
    arr = edge.get_id
    vertices[] = [@vertexes[arr[0]],@vertexes[arr[1]]]
  end
end
