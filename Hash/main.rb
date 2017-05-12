require_relative 'dollarProxy'
require_relative 'checksun/checksun'
require 'tk'
require 'date'
require 'time'


unless Checksun.verify "db.txt"
  puts "Erro: Arquivo alterado"
  exit
end


def download
  proxy = DollarProxy.new :writer
  proxy.download
  proxy.close
end

def restore year, month, day
  initialTime = Time.now
  proxy = DollarProxy.new :reader
  value = proxy.restore year, month, day
  time = Time.now-initialTime
  msgBox = Tk.messageBox(
    'type'    => "ok",
    'icon'    => "info",
    'title'   => "#{year}-#{month}-#{day}",
    'message' => "Gold Once:\nUSD#{value.to_f.round 5} \n #{(time.to_f*1000).round 3}ms"
  )

  puts "Date: #{year}-#{month}-#{day} \t\t #{value}"

end

#############
##   GUI   ##
#############

root = TkRoot.new { title "Dollar Scrapper" }


TkLabel.new(root) do
   text 'Year:'
   pack { padx 25 ; pady 100; }
end

entry1 = TkEntry.new(root) do
  pack {padx 25; pady 100; }
end


TkLabel.new(root) do
   text 'Month:'
   pack { padx 25 ; pady 100; }
end

entry2 = TkEntry.new(root) do
  pack {padx 25; pady 100; }
end


TkLabel.new(root) do
   text 'Day:'
   pack { padx 25 ; pady 100; }
end

entry3 = TkEntry.new(root) do
  pack {padx 25; pady 100; }
end

$year = TkVariable.new
$month = TkVariable.new
$day = TkVariable.new
entry1.textvariable = $year
entry2.textvariable = $month
entry3.textvariable = $day
$year.value = "1997"
$month.value = "1"
$day.value = "1"



btn_up = TkButton.new(root) do
  text "Download Hashfile"
  command (proc {
      download
    })
  pack("side" => "right",  "padx"=> "100", "pady"=> "100")
end

btn_Get = TkButton.new(root) do
  text "Get Value"
  command (proc {
    restore $year.value.to_i, $month.value.to_i, $day.value.to_i
    })
  pack("side" => "right",  "padx"=> "100", "pady"=> "100")
end





Tk.mainloop

puts "Bye bye"
