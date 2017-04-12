
module NetScrapper

  class Scrapper

    @day
    @month
    @year

    def initialize
    end

    def setDate year, month, day
      @day = day
      @month = month
      @year = year
    end

    def getDate
      return @year, @month, @day
    end

    def getValue
      return 0.0
    end

  end

end
