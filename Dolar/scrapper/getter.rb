require 'date'
require_relative "dollar"

class Getter
  def initialize

    @values = Hash.new

    @today = Date.today
    @init = Date.new(1997,1,1)

  end

  def execute filename

    file = File.new(filename, "a")



    loop {

      file.seek 0

      ds = DollarScrapper.new @init.year, @init.month, @init.day
      ds.execute
      value = ds.getValue
      @values[@init.to_s] = value
      puts value

      # puts "Dia #{@init.to_s} = #{@values[@init.to_s]}"

      if @init >= @today
        break
      end

      @init = @init.next
    }
  end

end
