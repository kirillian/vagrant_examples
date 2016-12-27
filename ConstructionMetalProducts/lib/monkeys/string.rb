class String
  def slugify
    self.downcase.strip.squeeze(' ').gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def to_b
    return true if self == 'true' || self.empty?
    return false if self == 'false'
    return nil
  end
end
