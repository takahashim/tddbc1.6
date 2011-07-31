class KV

  def initialize
    @hash = Hash.new
  end

  def put(key, value)
    raise ArgumentError if key.nil?
    @hash[key] = value
  end

  def get(key)
    @hash[key]
  end

  def dump
    print dump_string
  end

  def dump_string
    @hash.map {|key, value| "#{key}: #{value}\n"}.join("")
  end

  def delete(key)
    raise ArgumentError if key.nil?
    @hash.delete(key)
  end
  
  def mput(keys, values)
    unless keys.count == values.count
      raise ArgumentError
    end

    keys.each_with_index do |key, i|
      @hash[key] = values[i]
    end
  end
end
