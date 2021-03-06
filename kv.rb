require 'time'
class KV

  def initialize
    @hash = Hash.new
    @hash_time = Hash.new
  end

  def put(key, value)
    time = Time.now
    raise ArgumentError if key.nil?
    @hash[key] = value
    @hash_time[key] = time
  end

  def get(key)
    @hash[key]
  end

  def sort_by_time
    @hash_time.sort_by{|key, time| time}.reverse.map{|key, value| [key, @hash[key]]}
  end

  def dump
    print dump_string
  end

  def dump_string(time = nil)
    dump_array = sort_by_time
    if time
      dump_array.select!{|key, value| @hash_time[key] > time }
    end
    dump_array.map{|key, value| "#{key}: #{value}\n"}.join("")
  end

  def delete(key)
    raise ArgumentError if key.nil?
    @hash.delete(key)
    @hash_time.delete(key)
  end

  def mput(keys, values)
    unless keys.count == values.count
      raise ArgumentError
    end

    keys.each_with_index do |key, i|
      self.put(key, values[i])
    end
  end
end
