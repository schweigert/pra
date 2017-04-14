# Interface for hashfile
class Hashfile

  # Start a buffer to the file
  def initialize filename
    @file = File.new(filename, "a+")
  end

  # Return the hash value
  def hash data
    return 0
  end

  # Set the v data with h data
  def setValue h, v
    @file.pos = hash h
    @file.puts v
  end

  # Get the value in file with h data
  def getValue h
    @file.pos = hash h
    v = @file.gets

    return v
  end

  # Close file
  def close
    @file.close
  end

end
