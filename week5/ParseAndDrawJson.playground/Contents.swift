import Foundation

func parse(_ data: String){
    var jsonObject: [String:String] = [:]
    let WIDTH_HEIGHT_DELIMITER: String = ","
    let DATA_DELIMITER: String = "\n"
    
    
    let dataSep1: [String] = data.components(separatedBy: WIDTH_HEIGHT_DELIMITER)
    jsonObject["width"] = dataSep1[0]
    let dataSep2: [String] = dataSep1[1].components(separatedBy: DATA_DELIMITER)
    jsonObject["height"] = dataSep2[0]
    
    for elem in dataSep2{
        print(elem)
    }
}

var data = "10,5\n++++++++++\n+-P------+\n+--------+\n+-----o--+\n++++++++++\n"
parse(data)
