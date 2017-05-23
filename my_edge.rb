require 'yaml'

class MyEdge
  attr_accessor :label, :value, :id
  def initialize label=nil, value=nil
    @label=label
    @value=value
    @id = [-1,-1]
  end
  def set_id v1, v2
    @id = [v1,v2]
  end
  def get_id
    return :id
  end
end