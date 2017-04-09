require 'date'
require 'tk'

require_relative "scrapper/getter"

# CONFIGURAÇÃOpack { padx 15 ; pady 15; side 'left' }
$file = "hashdata.txt"
$g = Getter.new

def updateGetter
  puts "Updating file..."

  $g.update $file
end

def getValue year, month, day
  $g.getValue $file, Date.new(year,month,day)
end

###################
##### TK APP ######
###################

root = TkRoot.new { title "Dollar Scrapper" }

# Campos de entrada

year = TkEntry.new(root) do
  pack { padx 15 ; pady 15; side 'left' }
end
yearVar = TkVariable.new
year.textvariable = yearVar



month = TkEntry.new(root) do
  pack { padx 15 ; pady 15; side 'left' }
end
monthVar = TkVariable.new
month.textvariable = monthVar


day = TkEntry.new(root) do
  pack { padx 15 ; pady 15; side 'left' }
end
dayVar = TkVariable.new
day.textvariable = dayVar


TkButton.new(root) do
  text "Find!"
  pack { padx 15 ; pady 15; side 'left' }
  #command (proc{updateGetter})
end



TkLabel.new(root) do
   text 'Hello, World!'
   pack { padx 15 ; pady 15; side 'left' }
end

TkButton.new(root) do
  text "Update Hashdata!"
  pack { padx 15 ; pady 15; side 'left' }
  command (proc{updateGetter})
end

Tk.mainloop
