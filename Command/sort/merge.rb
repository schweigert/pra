require_relative "sort"


class Merge < Sort

	def init lista
		@array = lista
	end

	def execute
		return mergesort(copy(@array))
	end

	def mergesort list
	  return list if list.size <= 1
	  mid   = list.size / 2
	  left  = list[0, mid]
	  right = list[mid, list.size]
	  merge(mergesort(left), mergesort(right))
	end

	def merge left, right
	  sorted = []
	  until left.empty? || right.empty?
	    if left.first <= right.first
	      sorted << left.shift
	    else
	      sorted << right.shift
	    end
	  end
	  sorted.concat(left).concat(right)
	end
end
