
enum Barcode{
    case upc(Int, Int, Int, Int)
    case qrcode(String)
}

var a = Barcode.upc(8, 1234, 5678, 3)

print(a)

var b = (8, 1234, 5678, 3)
print(b)

switch a {
case .upc(8, _, _, 3):
    print("진짜 바코드")
default:
    print("가짜 바코드")
}

switch b {
case (8, _, _, 3):
    print("진짜 바코드")
default:
    print("가짜 바코드")
}
