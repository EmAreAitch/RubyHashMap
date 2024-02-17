# frozen_string_literal: true

class HashMap
  attr_reader :keys, :buckets

  def initialize
    @keys = []
    @buckets = Array.new(128)
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def set(key, value)
    @buckets += Array.new(@buckets.length * 2) if @keys.length >= @buckets.length * 0.75
    @buckets[hash(key) % @buckets.length] = value
    @keys << (key)
  end

  def get(key)
    @buckets[hash(key) % @buckets.length]
  end

  def has(key)
    !get(key).nil?
  end

  def remove(key)
    @buckets[hash(key) % @buckets.length] = nil
  end

  def length
    @keys.length
  end

  def values
    @keys.map { |i| get(i) }
  end

  def entries
    @keys.map { |i| [i, get(i)] }
  end
end

hash1 = HashMap.new

hash1.set('Rahib', 20)
hash1.set('Pranav', 25)
hash1.set('Bobby', 30)

puts hash1.entries
puts hash1.values
