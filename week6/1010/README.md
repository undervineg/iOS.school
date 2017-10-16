# 왜 viewDidLoad()부터 시작하나?
## 앱이 실행된 후의 과정
> 시작 → 메인UI (main.storyboard) → UIApplication 인스턴스 → AppDelegate 인스턴스 → ViewController 인스턴스 → storyboard의 view들이 다 만들어지고 나면 viewDidLoad() 호출 → 이 시점에 VC는 root view 포인터(var view)를 가지게 됨

- ∴ 코드로 UIView를 만드는 경우, root view가 필요하기 때문에 이것이 생성되는 시점인 viewDidLoad()에서 초기화를 시작한다.

****

## 싱글턴 디자인 패턴
> 인스턴스를 1개만 만들어 재활용하는 패턴. static 영역에 넣어둠

- 어느 VC나 어느 Data에서도 접근 가능



## Swift4 업데이트 일부 내용
- 단방향 범위 연산자
- String이 Character의 배열로 사용
- 업그레이드된 Dictionary



# View Controller
> 모든 UIViewController는 한 개의 RootView를 필수적으로 가짐

##역할 및 특징
- Child ViewController : VC는 자기자신 안에 View Controller를 붙일 수 있다.
- UserInteraction : View가 받은 모든 이벤트는 VC가 받아서 처리한다.
- Data Marshaling(중개자) : MVC 패턴에 의해 VC는 Model과 View의 중개자 역할을 한다.
- Resource Management : VC 안에 있는 모든 View나 Instance는 모두 VC 책임하에 있으며, 메모리가 부족하면 didReceiveMemoryWarning() 메소드가 자동으로 호출되고, 바로 viewDidLoad() 메소드를 다시 호출한다.

##종류
- **General VC** : RootView를 가지고 있으며, 각 RootView의 형태에 따라UIViewController, UITableViewController, UICollectionViewController 등으로 분류된다. 각각 RootView가 UIView, UITableView, UICollectionView이다.
- **Container VC** : 컨트롤러를 컨트롤하는 VC. Child ViewController를 가짐. UINavigationController, UITabbarController, UISplitViewController 등

##**1. General VC**
###인스턴스 생성

- 새 VC에 ID 부여. 현 VC에서 스토리보드 상의 특정 ID를 가지는 VC를 가져온다.
- xib 파일을 만든 경우 방법이 조금 다르지만, 스토리보드 생긴 이후로 xib 파일 잘 안 씀

<if let secondVC = 
self.storyboard?.instantiateViewController(withIdentifier: 
"SecondViewController") as? SecondViewController>

###화면 전환

- UIViewController의 화면 전환 방법 : Present Modally, UINavigationController, UITabbarController
- Storyboard 내에서의 화면 전환 방법 : Segue Instance를 사용
- 

