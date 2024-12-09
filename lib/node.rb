# frozen_string_literal: true

# Node in the LinkedList
class Node
  attr_accessor :value, :next_node

  def initialize
    @value = nil
    @next_node = nil
  end
end
