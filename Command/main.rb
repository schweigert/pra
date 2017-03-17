require_relative "sort/factory"

sorts = [:quick, :merge, :shell]

for i in sorts
	sort = SortFactory.create i
	sort.init [50,30,20,70,50]
	r = sort.execute
	p "#{i.to_s} method:"	
	p r
end
