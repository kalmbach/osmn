class Hash
  def to_struct(name)
    Struct.new(name, *keys).new(*values)
  end
end
