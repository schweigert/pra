# Scrapper for http://www.xe.com/

require 'date'
require 'net/http'

class XeGOScrapper

    @@lastValue = 368.9982476532

    def initialize date
      @year = date.year
      @month = date.month
      @day = date.day
      @date = "#{@year}-#{@month}-#{@day}"
      @uri = URI("http://www.xe.com/currencytables/?from=USD&date=#{@date}")
      @html = ""
    end

    def execute
      loop {
        begin
          @html = Net::HTTP.get @uri
        rescue
          # try
          next
        end
        break
      }
    end

    def getValue
      begin
        @html.delete! '\n'
        splited = @html.split "Gold Ouce"
        @value = (splited[1].split "</td><td class=\"historicalRateTable-rateHeader\">")[2].to_f
      rescue
        return @@lastValue;
      end
      @@lastValue = @value
      return @value
    end

  end
