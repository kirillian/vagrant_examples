class String
  def classify
    split("_").map{|str| str.titleize }.join("")
  end

  def titleize
    return upcase if length == 0
    [self[0].upcase, self[1..-1]].join("")
  end

  def constantize
    Object.const_get(to_sym)
  end
end
