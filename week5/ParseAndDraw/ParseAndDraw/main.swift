import Foundation

func parse(_ data: String)->Dictionary<String, String>{
    var jsonObject: [String:String] = [:]
    let WIDTH_HEIGHT_DELIMITER: String = ","
    let DATA_DELIMITER: String = "\n"
    
    
    let dataSep1: [String] = data.components(separatedBy: WIDTH_HEIGHT_DELIMITER)
    jsonObject["width"] = dataSep1[0]
    
    let dataSep2: [String] = dataSep1[1].components(separatedBy: DATA_DELIMITER)
    jsonObject["height"] = dataSep2[0]
    
    var realData = ""
    for index in 1..<dataSep2.count{
        realData += dataSep2[index] + DATA_DELIMITER
    }
    jsonObject["data"] = realData
    
    let isValidJSONObject: Bool = JSONSerialization.isValidJSONObject(jsonObject)
    
    if isValidJSONObject{
        return jsonObject
    }else{
        return [:]
    }
}

var data = "10,5\n++++++++++\n+-P------+\n+--------+\n+-----o--+\n++++++++++\n"
var jsonObject = parse(data)


func drawJson(_ jsonObject: Dictionary<String, String>){
    guard let data = jsonObject["data"] else{ return }
    
    print(data)
}

drawJson(jsonObject)
