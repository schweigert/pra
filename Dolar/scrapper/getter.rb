require 'date'
require_relative "dollar"

class Getter
  def initialize

    @values = Hash.new

    @today = Date.today
    @init = Date.new(1997,1,1)
    @initialHash = @init.to_time.to_i

    @maxDate = Date.new(2020,1,1)

  end

  def position date
    return ( date.to_time.to_i - @initialHash)/1000
  end

  def getValue filename, date
    file = File.new(filename, "r")
    @init = date
    file.pos = position date
    r = file.gets.to_f
    file.close
    return r
  end

  def update filename

    @init = Date.new(1997,1,1)

    file = File.new(filename, "w")

    for i in 0..((@maxDate.to_time.to_i - @initialHash)/1000 + 100)
      file.print " "
    end


    loop {

      file.pos = position @init

      ds = DollarScrapper.new @init.year, @init.month, @init.day
      ds.execute
      value = ds.getValue
      @values[@init.to_s] = value
      file.puts value

      puts "#{@init.to_s} <Writing in #{file.pos} value: #{value}>"

      # puts "Dia #{@init.to_s} = #{@values[@init.to_s]}"

      if @init >= @today
        break
      end

      @init = @init.next
    }

    file.close
  end

end
