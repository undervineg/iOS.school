class ViewController: UIViewController, UIScrollViewDelegate {
    
    
    var scrollView:UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // scrollExam1()
        scrollExam2()
    }
    
    func scrollExam2()
    {
        
        //scrollView 예제
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width * 3, height: scrollView.frame.size.height)
        scrollView.delegate = self
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        view.addSubview(scrollView)
        
        let viewWidth = scrollView.bounds.size.width
        let viewHeight = scrollView.bounds.size.height
        
        let view1:UIView = UIView(frame: CGRect(x: viewWidth * 0, y: 0, width: viewWidth, height: viewHeight))
        view1.backgroundColor = .red
        scrollView.addSubview(view1)
        
        let view2:UIView = UIView(frame: CGRect(x: viewWidth * 1, y: 0, width: viewWidth, height: viewHeight))
        view2.backgroundColor = .blue
        scrollView.addSubview(view2)
        
        let view3:UIView = UIView(frame: CGRect(x: viewWidth * 2, y: 0, width: viewWidth, height: viewHeight))
        view3.backgroundColor = .yellow
        scrollView.addSubview(view3)
        
        let switcher:UISwitch = UISwitch(frame: CGRect(x: 50, y: 100, width: 100, height: 100))
        switcher.addTarget(self, action: #selector(ViewController.valueChangeSwitcher(_:)), for: .valueChanged)
        scrollView.addSubview(switcher)
        
        
    }
    
    func valueChangeSwitcher(_ sender:UISwitch)
    {
        if sender.isOn
        {
            print("스위치 온")
        }else
        {
            print("스위치 오프")
        }
        
        
    }
    
    func scrollExam1()
    {
        
        
        //scrollView 예제
        let rect:CGRect = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height/2)
        scrollView = UIScrollView(frame: rect)
        scrollView.contentSize = CGSize(width: 1000, height: scrollView.frame.size.height)
        scrollView.delegate = self
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        
        view.addSubview(scrollView)
        
        for n in 0..<20
        {
            let row:CGFloat = CGFloat(n/10)
            let colum:CGFloat = CGFloat(n%10)
            
            let view:UIView = UIView(frame: CGRect(x: colum*100, y: row*100, width: 100, height: 100))
            view.tag = n
            view.backgroundColor = UIColor(red: CGFloat(colum)*25.0/255.0, green: CGFloat(row)*25.0/255.0, blue: CGFloat(n)*25.0/255.0, alpha: 1)
            scrollView.addSubview(view)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //        scrollView.setContentOffset(CGPoint(x: 400, y:0), animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX: CGFloat = scrollView.contentOffset.x
        
        let colorValue:CGFloat = 1 - (offsetX/(scrollView.contentSize.width - scrollView.frame.size.width))
        
        scrollView.backgroundColor = UIColor(red: 0, green: colorValue, blue: 0, alpha: 1)
    }
}