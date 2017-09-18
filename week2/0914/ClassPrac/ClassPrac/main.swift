
import Foundation


let account1: Account = Account(bankName: "우리은행", ammount: 3000)

let account2: Account = Account(bankName: "카카오뱅크", ammount: 5000)

let customer1: Customer = Customer(name: "라이언", address: "강남")

customer1.accounts = [account1, account2]
print(customer1.totalAmount())












