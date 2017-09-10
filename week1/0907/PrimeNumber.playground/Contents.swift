import Foundation

func allPrimeNumber(_ endNum: Int)->[Int]{
    var primes: [Int] = []
    primes.append(2)
    for i in 3...endNum{
        for j in 2..<i{
            if i%j == 0{        // 하나라도 나누어 떨어지는 것이 있으면 안쪽의 for문 탈출
                break
            }else{
                if j == i-1{    // 나누어 떨어지지 않으면서 나누는 수가 마지막 수인 경우, 소수로 판정!
                    primes.append(i)
                }
            }
        }
    }
    return primes
}


print(allPrimeNumber(10))