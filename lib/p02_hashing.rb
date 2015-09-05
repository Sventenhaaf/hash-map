class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hash = 0
    each.with_index do |el, i|
      hash ^= i.hash + el.hash
    end
    hash
  end
end

class String
  def hash
    hash = 0
    self.split("").each_with_index do |char, i|
      hash ^= i.hash + char.ord.hash
    end
    hash
  end
end

class Hash
  def hash
    self.keys.zip(self.values).sort.hash
  end
end
