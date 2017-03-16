require_relative "sort"

class Quick < Sort

	def init lista
		@array = lista
	end

	def execute
		return quick(copy(@array))
	end

	def quick lista
		if lista.size <= 1
			return lista
		end

		p = lista.pop
		pmaior = []
		pmenor = []

		for i in lista
			pmaior << i if i > p
			pmenor << i if i <= p
		end

		return (quick(pmenor))+[p]+(quick(pmaior))

	end


end
