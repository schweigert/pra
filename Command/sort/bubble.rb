require_relative "sort"


class Bubble < Sort

	def init lista
		@array = lista
	end

	def execute
		return bubble(copy(@array))
	end

	def bubble list

    t = list.size - 1

    for i in 0..t
      for j in 0..t
        list[i] , list[j] = list[j], list[i] if list[i] < list[j]
      end
    end

    return list

  end

end
