class KV

  def initialize
    @hash = Hash.new
  end

  def put(key, value)
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
    @hash.delete(key)
  end
end
