# frozen_string_literal: true

require_relative 'node'

# An Entire Linked List
class LinkedList
  attr_reader :head

  def initialize
    @head = nil
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
    if @head.nil?
      @head = Node.new value
    else
      tail.next_node = Node.new value
    end
    nil
  end

  def prepend(value)
    old_head = @head
    @head = Node.new value
    @head.next_node = old_head
    nil
  end

  def at(index)
    node = @head
    index.times do
      break if node.nil?

      node = node.next_node
    end
    node
  end

  def pop
    prev_node = @head
    node = @head
    return @head = nil if node&.next_node.nil?

    until node.next_node.nil?
      prev_node = node
      node = node.next_node
    end
    prev_node.next_node = nil
  end

  def contains?(value)
    !!find(value)
  end

  def find(value)
    count = 0
    node = @head
    until node.nil?
      return count if value == node.value

      count += 1
      node = node.next_node
    end
    nil
  end

  def to_s
    string = ''
    node = @head
    until node.nil?
      string += "( #{node.value} ) -> "
      node = node.next_node
    end
    string += 'nil'
    string
  end

  def insert_at(value, index)
    return prepend(value) unless index.positive?

    node = at(index - 1)
    return append(value) if node.nil?

    old_next_node = node.next_node
    node.next_node = Node.new value
    node.next_node.next_node = old_next_node
    nil
  end

  def delete_at(index)
    return @head = @head.next_node unless index.positive?

    prev_node = at(index - 1)
    return pop if prev_node&.next_node()&.next_node.nil?

    node = prev_node&.next_node
    prev_node&.next_node = node&.next_node
    nil
  end
end
