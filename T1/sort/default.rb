require_relative "sort"


class DefaultSort < Sort

	def init lista
		@array = lista
	end

	def execute
		return default(copy(@array))
	end

	def default list
    return list.sort
  end

end
