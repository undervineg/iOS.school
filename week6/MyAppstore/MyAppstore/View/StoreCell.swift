
import UIKit

class StoreCell: UITableViewCell {
  
  // Properties
  @IBOutlet weak var gradeLabel: UILabel!
  @IBOutlet weak var appIconImageView: UIImageView!
  @IBOutlet weak var mainLabel: UILabel!
  @IBOutlet weak var subLabel: UILabel!
  @IBOutlet weak var downloadButton: UIButton!
  
  /* StoreCell 인스턴스가 Nib파일(=스토리보드)에서 인스턴스화 될 때 호출이 된다.
   이 안에서 뷰가 할 일 중 하나인 자기가 어떻게 보여질지에 대한 코드를 구현해준다.
  */
  override func awakeFromNib() {
    super.awakeFromNib()
    
    appIconImageView.layer.cornerRadius = 10
    appIconImageView.layer.borderWidth = 1 / UIScreen.main.scale
    appIconImageView.layer.borderColor = UIColor.lightGray.cgColor
    
    downloadButton.layer.cornerRadius = 5
    downloadButton.layer.borderWidth = 1 
    downloadButton.layer.borderColor = self.tintColor!.cgColor
  }
  
  
  /// 데이터를 파라메터로 받아 UI를 업데이트
  func configureCell(data: StoreModel) {
    
    gradeLabel.text = String(data.grade)
    appIconImageView.image = UIImage(named: data.appIconImageString)
    mainLabel.text = data.mainText
    subLabel.text = data.subText
  }
  
}
