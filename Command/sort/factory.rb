require_relative "timsort"
require_relative "quick"
require_relative "merge"
require_relative "shell"
require_relative "bubble"
require_relative "default"
require_relative "selection"
require_relative "insertion"


class SortFactory

	def self.create type

		return Tim.new if type == :tim

		return Quick.new if type == :quick
		return Merge.new if type == :merge
		return Shell.new if type == :shell

		return Bubble.new if type == :bubble

		return Selection.new if type == :selection
		return Insertion.new if type == :insertion

		return DefaultSort.new if type == :default

		raise "#{type.to_s} don't exist"

	end

end
