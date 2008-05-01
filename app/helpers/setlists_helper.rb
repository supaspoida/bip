module SetlistsHelper
  
  def delimiter(performance, index)
    case performance.segue
    when true
      ">"
    when false
      ", " unless performance.setlist.performances_count = index
    when last?
      "."
    end
  end
end
