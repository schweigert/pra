
class BubbleLog < Bubble

  def execute
    puts "Starting #{self.class.to_s}"
    r = bubble(copy(@array))
    puts "Finish"
    return r
  end

end


class DefaultSortLog < DefaultSort

  def execute
    puts "Starting #{self.class.to_s}"
    r = default(copy(@array))
    puts "Finish"
    return r
  end

end

class InsertionLog < Insertion

  def execute
    puts "Starting #{self.class.to_s}"
    r = insertion(copy(@array))
    puts "Finish"
    return r
  end

end

class MergeLog < Merge

  def execute
    puts "Starting #{self.class.to_s}"
    r = mergesort(copy(@array))
    puts "Finish"
    return r
  end

end

class QuickLog < Quick

  def execute
    puts "Starting #{self.class.to_s}"
    r = quick(copy(@array))
    puts "Finish"
    return r
  end

end

class SelectionLog < Selection

  def execute
    puts "Starting #{self.class.to_s}"
    r = selection(copy(@array))
    puts "Finish"
    return r
  end

end

class ShellLog < Shell

  def execute
    puts "Starting #{self.class.to_s}"
    r = shellsort(copy(@array))
    puts "Finish"
    return r
  end

end

class TimLog < Tim

  def execute
    puts "Starting #{self.class.to_s}"
    r = tim(copy(@array))
    puts "Finish"
    return r
  end

end
