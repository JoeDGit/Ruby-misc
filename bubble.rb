# Build a method #bubble_sort that takes an array and returns a sorted array. It must use the bubble sort methodology (using #sort would be pretty pointless, wouldn’t it?).
# > bubble_sort([4,3,78,2,0,2])
# => [0,2,2,3,4,78]

def bubble_sort(array)
  k = 0
  i = 0
  n = i + 1
  j = array.length
  while k < j - 1
    while i < j - 1
      if array[i] > array[n]
        array[i], array[n] = array[n], array[i]
      end
      i += 1
      n = i + 1
    end
    k +=1
    i = 0
    n = i + 1
    
  end
  puts array
end



testing = [4,3,78,2,0,2]
bubble_sort(testing)