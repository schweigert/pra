require 'net/http'

class Scrapper

  def initialize ano
    @uri = URI('http://www.dolarhoje.net.br/dolar-comercial.php')
    @res = Net::HTTP.post_form(uri, 'ano' => ano)
  end



end
