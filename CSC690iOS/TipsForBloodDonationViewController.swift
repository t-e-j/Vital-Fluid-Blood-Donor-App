//
//  TipsForBloodDonationViewController.swift
//  CSC690iOS
//
//  Created by Tejasvi Belsare on 12/11/18.
//  Copyright © 2018 Tejasvi Belsare. All rights reserved.
//


import UIKit


struct cellData1 {
    
    var opened = Bool()
    var title = String()
    //    var sectionData = [String]()     /////// difference
    var sectionData = String()
    
}

class TipsForBloodDonationViewController : UITableViewController {
    
    var tableViewData = [cellData1]()
    
    //    @IBOutlet weak var titleLabel: UILabel!      ////// label Title on each cell
    let tipsForBloodDonation1 = " • In the days before your donation, eat healthy, iron-rich foods such as spinach, red meat, fish, poultry, beans, iron-fortified cereals and raisins. This will help maintain a healthy iron level. The number one reason for deferrals is anemia. \n\n • Get a good night’s sleep.  \n\n • At least 3 hours before donating, eat a balanced meal and avoid fatty foods, such as hamburgers, fries, or ice cream. \n\n • Drink an extra 16 oz. of water and fluids before the donation; you can be deferred for dehydration. \n\n • Don’t forget to bring a valid government-issued photo ID, a list of medications you are taking, and a list of places you have visited outside of the U.S. in the past 3 years."
    
    let tipsForBloodDonation2 = " • Wear clothing with short sleeves or sleeves that can be raised above the elbow. \n\n • If you have a preference of arm or vein that you like the phlebotomist to use for your donation, let them know. \n\n • Lie down flat when you donate. This helps with the drop in blood pressure and the lightheadedness, especially when it is your first time.\n\n • Relax, listen to music, talk to others, or watch movies on our comfortable donor lounge chairs designed specifically for apheresis donations. \n\n • If you feel faint, tell the medical staff. They will assist you into a reclining position on the chair. \n\n • Enjoy an assortment of refreshments in our canteen area immediately after donating."
    
    let tipsForBloodDonation3 = " • Take rest at the clinic, drink the fluids recommended by the nurse and eat the snacks provided immediately after donating. \n\n • Drink plenty of fluids over the next 24-48 hours to replenish any fluids you lost during donation. \n\n • Do not skip any meals and make sure to eat after your donation. \n\n • Avoid strenuous physical activity or heavy lifting for about 24 hours after donation. \n\n • If you feel light headed, lie down, preferably with feet elevated, until the feeling passes \n\n • If you feel faint and if you've already left the donation center, put your head between your knees to increase blood flow to your brain, or lay down and elevate your legs if you can. \n\n •If something doesn’t feel right, call the Donor Center’s toll-free number provided to you after your donation. \n\n • Enjoy your day and know that you have made a positive difference!"
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        tableViewData = [cellData1(opened: false, title: " Before blood donation", sectionData: tipsForBloodDonation1),
                         cellData1(opened: false, title: " During blood donation", sectionData: tipsForBloodDonation2),
                         cellData1(opened: false, title: " After blood donation", sectionData: tipsForBloodDonation3)]
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true {
            //            return tableViewData[section].sectionData.count
            return 2
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        //        else { return UITableViewCell() }
        //        cell.backgroundView = UIImageView(image: UIImage(named: "blood.jpg")!)
        
        
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
                else { return UITableViewCell()}
            
            cell.textLabel?.text = tableViewData[indexPath.section].title
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
                else { return UITableViewCell()}
            
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData  /////// difference
            //cell.textLabel?.text = tableViewData[indexPath.section].sectionData[indexPath.row]
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableViewData[indexPath.section].opened == true {
            tableViewData[indexPath.section].opened = false
            
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
            
        } else {
            tableViewData[indexPath.section].opened = true
            
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
            
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //        cell.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"cell_normal.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0] ];
        //        cell.selectedBackgroundView =  [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"cell_pressed.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0] ];
        //
        //        cell.backgroundView = UIImageView(image: UIImage(named: "blood.jpg")!)
        //        if ( indexPath.row % 2 == 0 ) {
        //            cell.backgroundColor = UIColor.white
        ////            cell.backgroundColor = UIColor.clear
        //        } else{
        ////            cell.backgroundColor = UIColor .red
        //            cell.backgroundView = UIImageView(image: UIImage(named: "blood1.jpg")!)
        //            cell.backgroundColor = UIColor.clear
        //            cell.textLabel?.textColor = UIColor.white
        //        }
        
        cell.backgroundColor = UIColor.white
        
        if tableViewData[indexPath.section].opened == true {
            cell.backgroundView = UIImageView(image: UIImage(named: "blood2.jpg")!)
            //            cell.backgroundColor = UIColor.clear
            cell.textLabel?.textColor = UIColor.white
            cell.backgroundColor = UIColor(white: 0.4, alpha: 0.5)
            
            if ( indexPath.row % 2 == 0 ) {
                cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 22.0)
            }
        }
        else {
            cell.backgroundView = nil
            cell.backgroundColor = UIColor.white
            cell.textLabel?.textColor = UIColor.black
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.tableFooterView = UIView(frame: CGRect.zero)   /// to hide the extra cells down
    }
    
    
    
    
    //    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return UITableView.automaticDimension
    //    }
    
    
}



