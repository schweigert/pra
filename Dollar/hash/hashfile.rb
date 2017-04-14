require 'thread'


# Interface for hashfile
class Hashfile



  # Start a buffer to the file
  def initialize filename
    # Thread safe sys
    @semaphore = Mutex.new

    @file = File.new(filename, "a+")
  end

  # Return the hash value
  def hash data
    return 0
  end

  # Set the v data with h data
  def setValue h, v
    @semaphore.synchronize do
      @file.pos = hash h
      @file.puts v
    end
  end

  # Get the value in file with h data
  def getValue h
    @semaphore.synchronize do
      @file.pos = hash h
      v = @file.gets
    end
    return v
  end

  # Close file
  def close
    @file.close
  end

end
