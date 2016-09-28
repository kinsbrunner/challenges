def solution(a, b)
  survivor = 0
  downstream = []
  i = 0
  
  while i < b.length
    if b[i] == 0 
      if downstream.empty?
        survivor += 1
      else
        while !downstream.empty? && a[i] > downstream[-1]
          downstream.pop
        end
        survivor += 1 if downstream.empty?
      end
    else
      downstream << a[i]
    end
    i += 1
  end  
  
  while !downstream.empty?
    survivor += 1
    downstream.pop
  end
  
  return survivor
end