require 'byebug'

class Link
  attr_accessor :key, :val, :next


  def initialize(key = nil, val = nil, nxt = nil)
    @key, @val, @next = key, val, nxt
  end

  def to_s
    "#{@key}, #{@val}"
  end
end

class LinkedList
  attr_reader :head

  include Enumerable

  def initialize
    @head = Link.new
    @tail = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.val
  end

  def last
    @tail.val
  end

  def empty?
    @head.key.nil? && @head.val.nil? && @head.next.nil?
  end

  def get(key)
    return first if empty?
    link = @head
    until link.nil?
      return link.val if link.key == key
      link = link.next
    end
    nil
  end

  def include?(key)
    !!get(key)
  end

  def insert(key, val)
    if self.empty?
      @head.val = val
      @head.key = key
    else
      new_link = Link.new(key, val)
      @tail.next = new_link
      @tail = new_link
    end
  end

  def remove(key)
    return first if empty?

    deleted_val = nil

    current_link = @head
    if current_link.key == key
      deleted_val = @head.val
      @head = @head.next
      return deleted_val
    end

    until current_link.next.nil?
      if current_link.next.key == key
        deleted_val = current_link.next.value
        current_link.next = current_link.next.next
        break
      end
      current_link = current_link.next
    end
    deleted_val
  end


  def each(&prc)
    current_link = @head
    until current_link.next == nil
      prc.call(current_link)
      current_link = current_link.next
    end
    self
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
