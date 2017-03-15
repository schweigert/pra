require_relative "sort"


class Selection < Sort

	def init lista
		@array = lista
	end

	def execute
		return selection(copy(@array))
	end

	def selection list

    n = list.size - 1

    n.times do |i|
      index_min = i

      (i + 1).upto(n) do |j|
        index_min = j if list[j] < list[index_min]
      end

      list[i], list[index_min] = list[index_min], list[i] if index_min != i
    end

    return list
  end

end
