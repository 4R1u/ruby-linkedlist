# frozen_string_literal: true

require_relative 'node'

# An Entire Linked List
class LinkedList
  attr_reader :head

  def initialize
    @head = Node.new
  end

  def tail
    node = @head
    node = node.next_node until node.next_node.nil?
    node
  end

  def size
    node = @head
    count = @head.nil? ? 0 : 1
    until node.next_node.nil?
      node = node.next_node
      count += 1
    end
    count
  end
end
