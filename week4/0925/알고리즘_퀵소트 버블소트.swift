//bubble sort

var bubbleSort:[Int] = [4,4,0,5]

print(bubbleSort)

for i in 0...(bubbleSort.count - 1) {
    
    for j in 0...(bubbleSort.count - 2) {
        
        if bubbleSort[j] > bubbleSort[j+1] {
            (bubbleSort[j], bubbleSort[j+1]) = (bubbleSort[j+1], bubbleSort[j])
            
        }
    }
    
    
}

print(bubbleSort)

// 성능은 데이터 개수가 4개 일때 3x3번 연산을함..


// quick sort


func quickSort(data:[Int]) ->[Int] {
    
    if data.count <= 1 {
        return data
    }
    
    var pivot = data[(data.count-1)/2]
    
    var left:[Int] = []
    var right:[Int] = []
    
    var equl:[Int] = []
    
    for i in data {
        
        if pivot > i {
            left.append(i)
            
        }else if pivot < i {
            right.append(i)
            
        }else {
            equl.append(i)
        }
    }
    
    return quickSort(data: left) + equl + quickSort(data: right)
    
    
    
}


var tagetData:[Int] = [3,4,3,3,5,2]

print(quickSort(data: tagetData))