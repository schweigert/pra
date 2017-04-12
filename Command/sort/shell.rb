require_relative "sort"

class Shell < Sort

	def init lista
		@array = lista
	end

	def execute
		return shellsort(copy(@array))
	end

	def shellsort(list)
		d = list.length
		return -1 if d == 0

		until d/2 == 0 do
			d = d / 2
			0.step(list.length) do |i|
				(i+d).step(list.length-1, d) do |igap|
					temp = list[igap]
					j = igap
					while j >= i do
						break if list[j] >= list[j - d]
						list[j] = list[j-d]
						j -= d
					end
				list[j] = temp
		  		end
	 		end
		end
		return list
	end


end
