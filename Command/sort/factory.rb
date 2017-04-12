require_relative "timsort"
require_relative "quick"
require_relative "merge"
require_relative "shell"
require_relative "bubble"
require_relative "default"
require_relative "selection"
require_relative "insertion"

require_relative "adapter/sorts"

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

	def self.createDebuggin type
		return TimLog.new if type == :tim

		return QuickLog.new if type == :quick
		return MergeLog.new if type == :merge
		return ShellLog.new if type == :shell

		return BubbleLog.new if type == :bubble

		return SelectionLog.new if type == :selection
		return InsertionLog.new if type == :insertion

		return DefaultSortLog.new if type == :default

		raise "#{type.to_s} don't exist"
	end

end
