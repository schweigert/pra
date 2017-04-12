require_relative "dollar"


module NetScrapper

  # Fábrica de Scrappers
  class Factory

    # Define os tipos de Scrapper
    def self.types
      return :USD,:BRL
    end

    #  Método principal da fábrica
    def self.create type

      # Select Types
      return DollarScrapper.new if type == :USD

      # Default
      return Scrapper.new

    end

  end
end
