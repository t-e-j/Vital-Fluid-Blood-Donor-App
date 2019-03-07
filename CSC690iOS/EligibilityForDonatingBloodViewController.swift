//
//  EligibilityForDonatingBloodViewController.swift
//  CSC690iOS
//
//  Created by Tejasvi Belsare on 12/13/18.
//  Copyright © 2018 Tejasvi Belsare. All rights reserved.
//

import UIKit

struct cellData4 {
    
    var opened = Bool()
    var title = String()
    //    var sectionData = [String]()     /////// difference
    var sectionData = String()
    
}

class EligibilityForDonatingBloodViewController : UITableViewController {
    
    var tableViewData = [cellData4]()
    
    //    @IBOutlet weak var titleLabel: UILabel!      ////// label Title on each cell
    let eligibility1 = " • You must be at least 17 years old to donate to the general blood supply. There is no upper age limit for blood donation as long as you are well with no restrictions or limitations to your activities."
    
    let eligibility2 = " • Acceptable as long as your blood pressure is below 180 systolic (first number) and below 100 diastolic (second number) at the time of donation. Medications for high blood pressure do not disqualify you from donating."
    
    let eligibility3 = " • You must not donate if you have had a tongue, nose, belly button or genital piercing in the past 12 months (donors with pierced ears are eligible)."
    
    let eligibility4 = " • Wait if you have a fever or a productive cough (bringing up phlegm). Wait if you do not feel well on the day of donation. Wait until you have completed antibiotic treatment for sinus, throat or lung infection."
    
    let eligibility5 = " • Acceptable as long as it is well controlled, whether medication is taken or not."
    
    let eligibility6 = " • A meal is recommended at least four hours prior to donation. Drink plenty of fluids."
    
    let eligibility7 = " • Men who have had sex with other men, at any time since 1977 (the beginning of the AIDS epidemic in the United States) are currently deferred as blood donors. This is because MSM are, as a group, at increased risk for HIV, hepatitis B and certain other infections that can be transmitted by transfusion."
    
    let eligibility8 = " • One-year deferral."
    
    let eligibility9 = " • You must weigh at least 110 pounds to be eligible for blood donation for your own safety. Blood volume is in proportion to body weight. Donors who weigh less than 110 pounds may not tolerate the removal of the required volume of blood as well as those who weigh more than 110 pounds. There is no upper weight limit as long as your weight is not higher than the weight limit of the donor bed or lounge you are using. You can discuss any upper weight limitations of beds and lounges with your local health historian."
    
    let eligibility10 = " • Hemoglobin, Travel, Cancer, Medications, Hepatitis, and HIV Risk"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        tableViewData = [cellData4(opened: false, title: " Age", sectionData: eligibility1),
                         cellData4(opened: false, title: " High blood pressure", sectionData: eligibility2),
                         cellData4(opened: false, title: " Body piercing", sectionData: eligibility3),
                         cellData4(opened: false, title: " Cold anf Flu", sectionData: eligibility4),
                         cellData4(opened: false, title: " Diabetes", sectionData: eligibility5),
                         cellData4(opened: false, title: " Diet", sectionData: eligibility6),
                         cellData4(opened: false, title: " MSM", sectionData: eligibility7),
                         cellData4(opened: false, title: " Tattoos", sectionData: eligibility8),
                         cellData4(opened: false, title: " Weight", sectionData: eligibility9),
                         cellData4(opened: false, title: " Other criteria", sectionData: eligibility10)]
        
        
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
            //            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15.0)
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

