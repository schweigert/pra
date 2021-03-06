require 'date'

require_relative "hash/dateHashfile"
require_relative "scrapper/xego"

class DollarProxy

  def initialize type
    @hashfile = DateHashfile.new "db.txt", type
    @hashfile.setFirstDate Date.new 1997, 1, 1
    @hashfile.setSize 20
  end

  def restore year, month, day
    date = Date.new year, month, day
    if date < Date.new(1997, 1, 1) || date > Date.today
      raise "Invalid Date"
    end

    v = @hashfile.getValue date

    begin
      puts "#{date.to_s}:: Next 100 days:"
      for i in 0..100
        date = date.next
        puts "#{date.to_s}: #{(@hashfile.getValue date).to_f.round 5}"
      end
    rescue

    end

    return v
  end

  def download
    selected = Date.new 1997,1,1
    today = Date.today
    totaldays = (today - selected).to_i
    puts "Donwloading data..."
    loop do
      break if selected == today
      puts "#{selected.to_s}"

      scrapper = XeGOScrapper.new selected
      scrapper.execute
      @hashfile.setValue selected, scrapper.getValue
      selected = selected.next
    end

  end

  def close
    @hashfile.close
  end

end
