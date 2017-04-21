require 'digest/bubblebabble'


class Checksun

	def self.make filename
		
		# Read txt
		file = File.new filename, "r"		
		txt = file.read
		txt = txt+"SenhaAppend"
		# Gen Hash
		sun = Digest::SHA256.bubblebabble txt
		file.close

		# Write Hash
		filecheck = File.new (filename+".sun"), "w"
		filecheck.puts sun
		filecheck.close
	end

	def self.verify filename
		
		# Read txt
		file = File.new filename, "r"
		

		txt = file.read
		txt = txt+"SenhaAppend"

		sun = Digest::SHA256.bubblebabble txt
		file.close

		sunfile = File.new (filename+".sun"), "r"
		correctSun = sunfile.read.chomp

		r = correctSun == sun

		return r
	end
end
