class Node
  attr_accessor :adjacent_nodes, :pos
  def initialize(pos)
    @adjacent_nodes = []
    @pos = pos
  end

  def add_edge(node)
    @adjacent_nodes << node
  end

  def swap(other)
    @pos = other
  end

end