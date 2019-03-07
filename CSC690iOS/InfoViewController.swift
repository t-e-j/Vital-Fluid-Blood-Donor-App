//
//  ViewController.swift
//  Vital Fluid
//
//  Created by Tejasvi Belsare on 12/4/18.
//  Copyright © 2018 Tejasvi Belsare. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    var names = [String]()
//    names = ["Download Form","Benefits of blood donation","Tips before donating blood","Tips after donating blood","Food Habits","Eligibility for donating blood","What happens with your blood"]
    
    var identities = [String]()

//    @IBOutlet weak var infoViewImages: UIImageView!
    
    @IBOutlet weak var imageView: UIImageView!
    var imageArray = [UIImage]()
//    let imageView = UIImageView()
    
    @IBOutlet weak var infoTableView: UITableView!
    
    //let number = Int.random(in: 0 ..< 15)            //versions 4.2 and above
    let number = Int(arc4random_uniform(15))
//    @IBOutlet var infoViewImages: [UIImageView]!
//    @IBOutlet weak var infoTableView: UITableView!
//
//
    @IBOutlet weak var infoNavigationBarButton: UIBarButtonItem!

    @IBAction func infoNavigationBarButtonPressed(_ sender: Any) {
//        if (infoTableView.isHidden == true){
//            infoTableView.isHidden = false
//
//        }
//        else{
            infoTableView.isHidden = false
            infoNavigationBarButton.isEnabled = false
//        }
    }
    
//        let scrollView: UIScrollView = {
//        let scroll = UIScrollView()
//        scroll.isPagingEnabled = true
//        scroll.showsVerticalScrollIndicator = false
//        scroll.showsHorizontalScrollIndicator = false
//        scroll.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//        return scroll
//        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
//        let attrs = [
//            NSAttributedString.Key.foregroundColor: UIColor.red,
//            NSAttributedString.Key.font: UIFont(name: "Georgia-Bold", size: 30)!
//        ]
        
//        UINavigationBar.appearance().titleTextAttributes = attrs
        self.title = "Vital Fluid"
        
        
        infoTableView.isHidden = true
        infoTableView.backgroundView = UIImageView(image: UIImage(named: "blood3.png"))
    
        infoTableView.backgroundColor = UIColor.clear
        
        names = ["Blood donation form","Benefits of blood donation","Tips for blood donation","Eligibility for donating blood", "How your body replaces blood?","What happens to donated blood?"]
        
        identities = ["A","B","C","E","F","G"]
        
//        imageArray = [UIImage(named:"motivate1.jpeg")!,UIImage(named:"motivate2.jpeg")!,UIImage(named:"motivate3.jpg")!,UIImage(named:"motivate4.jpg")!,UIImage(named:"motivate5.jpg")!,UIImage(named:"motivate6.jpg")!, UIImage(named: "motivate7.jpg")!]

        
        imageArray = [#imageLiteral(resourceName: "motivate6"), #imageLiteral(resourceName: "motivate11"), #imageLiteral(resourceName: "motivate14"), #imageLiteral(resourceName: "motivate2"), #imageLiteral(resourceName: "motivate15"), #imageLiteral(resourceName: "motivate3"), #imageLiteral(resourceName: "motivate8"), #imageLiteral(resourceName: "motivate7"), #imageLiteral(resourceName: "d51002dfcefe1310e7da7f6b07914db2"), #imageLiteral(resourceName: "motivate13"), #imageLiteral(resourceName: "motivate5"), #imageLiteral(resourceName: "motivate1"), #imageLiteral(resourceName: "motivate10"), #imageLiteral(resourceName: "motivate12"), #imageLiteral(resourceName: "motivate9"), #imageLiteral(resourceName: "motivate4")]
        imageView.contentMode = .scaleAspectFit
            
        imageView.image = imageArray[number]
        
        
        
//        for i in 0..<imageArray.count {
//
////            let imageView = UIImageView()
//            if infoViewImages.image = imageArray[i] {
//
//                let xPosition = UIScreen.main.bounds.width * CGFloat(i)
//                infoViewImages.frame = CGRect(x: xPosition, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
//                infoViewImages.contentMode = .scaleAspectFit
//
//                scrollView.contentSize.width = scrollView.frame.width * CGFloat(i + 1)
//                scrollView.addSubview(infoViewImages)
//                scrollView.delegate = self
        
//    }

    }
    
    override func loadView() {
        super.loadView()
        infoTableView.delegate = self
        infoTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

//        tableView.tableFooterView = UIView(frame: CGRect.zero)
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = names[indexPath.row]
//        cell?.textLabel?.numberOfLines = 0
        
//        cell?.textLabel?.text = String(indexPath.row)
        print (names[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vcName = identities[indexPath.row]
        
        let viewCntrl = storyboard?.instantiateViewController(withIdentifier: vcName)
     
        self.navigationController?.pushViewController(viewCntrl!, animated: true)
        

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 103.0
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        tableView.tableFooterView = UIView(frame: CGRect.zero)   /// to hide the extra cells down
//    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
        cell.backgroundColor = UIColor(white: 1, alpha: 0.5)
    }

}

