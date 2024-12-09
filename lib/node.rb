# frozen_string_literal: true

# Node in the LinkedList
class Node
  attr_reader :next_node
  attr_accessor :value

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

  def next_node=(node)
    @next_node = node if node.is_a?(Node) || node.nil?
  end
end
