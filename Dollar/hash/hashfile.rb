require 'thread'


# Interface for hashfile
class Hashfile



  # Start a buffer to the file
  def initialize filename, type
    # Thread safe sys
    @semaphore = Mutex.new

    # Open a file
    @filename = filename
    @file = File.new(@filename, "w") if type == :writer
    @file = File.new(@filename, "r") if type == :reader

    @type = type
  end

  # Return the hash value
  def hash data
    return 0
  end

  # Set the v data with h data
  def setValue h, v
    raise "This isn't a Writer!" if @type != :writer
    @semaphore.synchronize do
      pos = hash h
      clearPos pos
      @file.pos = pos
      @file.puts v
    end
  end

  def clearPos pos
    @file.pos = pos
    @file.print " "*@size
  end

  # Get the value in file with h data
  def getValue h
    raise "This isn't a Reader!" if @type != :reader
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
