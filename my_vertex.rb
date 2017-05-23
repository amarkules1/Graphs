require 'yaml'

class MyVertex
  attr_accessor :label, :value, :id
  def initialize label=nil, value=nil
    @label=label
    @value=value
    @id = -1
  end

end