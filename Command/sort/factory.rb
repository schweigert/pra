require_relative "quick"
require_relative "merge"
require_relative "shell"

class SortFactory

	def self.create type
		
		return Quick.new if type == :quick
		return Merge.new if type == :merge
		return Shell.new if type == :shell

		raise "#{type.to_s} don't exist"

	end

end
