func drawStars1(line: Int){
    for each in 1...line{
        var str: String = ""
        for _ in 1...each*2-1{
            str += "*"
        }
        print(str)
    }
}

/*
func drawStars2(line: Int){ // 역순 별쌓기
    while line {
        <#code#>
    }
    for each in 1...line{
        var str: String = ""
        var i: Int = line*2-1
        while i > 0 {
            str += "*"
            i -= 1
        }
        print(str)
    }
}
*/


func drawStars3(line: Int){
    for each in 0..<line{
        var str: String = ""
        
        for _ in 0..<line-each{
            str += " "
        }
        
        for _ in 0..<2*each+1{
            str += "*"
        }
        print(str)
    }
}

drawStars3(line: 3)
