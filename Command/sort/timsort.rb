require_relative "sort"
require_relative "factory"

class Tim < Sort

	def init lista
		@array = lista
	end

	def execute
		return tim(copy(@array))
	end

	def tim list

    n = getMin(list.size)

    tam = list.size

    nruns = tam/n

    runs = []

    nruns.times do
      runs << []
    end

    for i in runs
      break if list.empty?
      i << list.pop
      loop {
        break if list.empty?
        unless i.last > list.last
          if i.size >= n
            break
          end
        end
        i << list.pop
      }
    end
    sruns = []

    sort = SortFactory.create(:insertion)

    for i in runs
      sort.init i
      sruns += sort.execute
      i.clear
    end

    sort = SortFactory.create(:merge)
    sort.init sruns
    return sort.execute

  end

  def getMin n
    r = 0;
    while n >= 64
      r = r || (n&&1)
      n = n>>1
    end
    return n+r
  end

end
