require_relative "sort"


class Insertion < Sort

	def init lista
		@array = lista
	end

	def execute
		return insertion(copy(@array))
	end

	def insertion array
    final = [array[0]]
        array.delete_at(0)
        for i in array
            final_index = 0
            while final_index < final.length
                if i <= final[final_index]
                    final.insert(final_index,i)
                    break
                elsif final_index == final.length-1
                    final.insert(final_index+1,i)
                    break
                end
                final_index+=1
            end
        end
    return final
  end

end
