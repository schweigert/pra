require 'net/http'

class DollarScrapper

  @@lastValue = 368.9982476532

  def initialize year, month, day

    @year = year
    @month = month
    @day = day
    @date = "#{@year}-#{@month}-#{@day}"
    @uri = URI("http://www.xe.com/currencytables/?from=USD&date=#{@date}")
    @html = ""
  end

  def execute
    @html = Net::HTTP.get @uri
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
