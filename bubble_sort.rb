# bubble_sort method for The Odin Project

def bubble_sort(array)
    len = array.length - 1
    loop do
        swapped = false
        for i in 1..len do
            if array[i-1] > array[i]
                num = array[i-1]
                array[i-1] = array[i]
                array[i] = num
                swapped = true
            end
        end
        if !swapped
            return array
        end
    end
end

array = [4,3,78,2,0,2]
p bubble_sort(array)