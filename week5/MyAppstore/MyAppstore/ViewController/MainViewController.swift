
import UIKit

class MainViewController: UIViewController {
  
  // Properties
  @IBOutlet weak var tableView: UITableView!
  var model: [StoreModel] = [
    StoreModel(grade: 1, appIconImageString: "Clock", mainText: "코레일톡4.0", subText: "여행"),
    StoreModel(grade: 2, appIconImageString: "Hat", mainText: "모두의경영", subText: "게임"),
    StoreModel(grade: 3, appIconImageString: "Lighter", mainText: "QUEST: 할일관리", subText: "생산성"),
    StoreModel(grade: 4, appIconImageString: "Loupe", mainText: "카카오택시", subText: "여행"),
    StoreModel(grade: 5, appIconImageString: "Mug", mainText: "모여라웹툰", subText: "도서"),
    StoreModel(grade: 6, appIconImageString: "Pipe", mainText: "후스콜", subText: "유틸리티"),
    StoreModel(grade: 7, appIconImageString: "Tent", mainText: "이상하다", subText: "아무거나"),
    StoreModel(grade: 8, appIconImageString: "Toilet_paper", mainText: "화장실", subText: "아무거나"),
  ]
  
  // View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  
}


// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return model.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StoreCell
    cell.configureCell(data: model[indexPath.row])
    
    return cell
  }
  
}
