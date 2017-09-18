

import Foundation


class Customer {
  
  let name: String
  var address: String

  var accounts: [Account] = []
  
  init(name: String, address: String) {
    self.name = name
    self.address = address
  }
  
  func totalAmount() -> Int {
    
    var total: Int = 0
    
    for account in accounts {
      total += account.ammount
    }
    
    return total
  }
}










