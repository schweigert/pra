require 'date'

require_relative "hashfile"

# Implements hashfile with Date class
# 80 bytes for data
class DateHashfile < Hashfile

  @init = Date.new 1997, 1, 1
  @size = 20

  def setFirstDate date
    @init = date
  end

  def setSize n
    @size = n+1
  end



  # Data is a Date class
  def hash h
    # raise if data isn't Date class
    raise "Hash isn't Date class" if h.class != Date

    days = (h - @init).to_i
    position = days * @size

    return position
  end

end
