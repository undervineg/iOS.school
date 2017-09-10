func mkNewIndex(alphabets: [String], element: String, keyNumber: Int)->String{
    var newIndex: Int = 0
    let currIndex: Int = alphabets.index(of: element)!
    newIndex = currIndex + keyNumber
    if newIndex > alphabets.count{
        newIndex -= 26
    }
    
    return alphabets[newIndex]
}

func ceasar(_ data:[String], _ keyNum:Int)->[String]{
    let upperAlphabet: [String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    let lowerAlphabet: [String] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    var returnVal: [String] = []
    
    for elem in data {
        if upperAlphabet.contains(elem){
            returnVal.append(mkNewIndex(alphabets: upperAlphabet, element: elem, keyNumber: keyNum))
        }else{
            returnVal.append(mkNewIndex(alphabets: lowerAlphabet, element: elem, keyNumber: keyNum))
        }
    }
    return returnVal
}


print(ceasar(["Z","z","Y","y"], 3))
