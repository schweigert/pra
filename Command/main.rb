require_relative 'sort/merge'
require_relative 'sort/quick'
require_relative 'sort/shell'


merge = Merge.new
merge.init [5,4,3,7,9]
resultado = merge.execute
p resultado

quick = Quick.new
quick.init [77,88,99,20,11,44,25,96]
resultado = quick.execute
p resultado

shell = Shell.new
shell.init [77,88,99,20,11,44,25,96]
resultado = shell.execute
p resultado
