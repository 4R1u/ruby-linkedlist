# frozen_string_literal: true

require_relative 'node'

# An Entire Linked List
class LinkedList
  attr_reader :head

  def initialize(value = nil)
    @head = Node.new(value)
  end

  def tail
    node = @head
    return nil if node.nil?

    node = node.next_node until node.next_node.nil?
    node
  end

  def size
    node = @head
    return 0 if node.nil?

    count = 1
    until node.next_node.nil?
      node = node.next_node
      count += 1
    end
    count
  end

  def append(value)
    tail.next_node = Node.new value
  end

  def prepend(value)
    old_head = @head
    @head = Node.new(value)
    @head.next_node = old_head
  end
end
