require_relative "sort/factory"

sorts = [:tim, :quick, :merge, :shell,:bubble,:insertion, :selection]

lista = []

1000.times do
	lista << (rand*1000).to_i
end

for i in sorts
	sort = SortFactory.createDebuggin i
	sort.init lista
	r = sort.execute
	p r
end
