//
//  BenefitsOfBloodDonationViewController.swift
//  CSC690iOS
//
//  Created by Tejasvi Belsare on 12/10/18.
//  Copyright © 2018 Tejasvi Belsare. All rights reserved.
//

import UIKit


struct cellData {
    
    var opened = Bool()
    var title = String()
//    var sectionData = [String]()     /////// difference
    var sectionData = String()
    
}

class BenefitsOfBloodDonationViewController : UITableViewController {
    
    var tableViewData = [cellData]()
    
//    @IBOutlet weak var titleLabel: UILabel!      ////// label Title on each cell
    let benefitsOfBloodDonation1 = " • While it isn’t the same thing as a trip to the doctor, donating blood can be another way to keep an eye on your cardiovascular health. \n\n • You’ll receive a mini-physical prior to the blood draw, in which someone will check your pulse, blood pressure, body temperature, hemoglobin and more. \n\n • This can sometimes shed light on issues you didn’t even know about. \n\n • Clinic will also inform you of any other blood issues they notice or if anything seems unusual. \n\n • An occasional check up on your blood quality could be the key to spotting a health issue before it becomes life-threatening."
    
    let benefitsOfBloodDonation2 = " • One in every two hundred people in the U.S. is affected by a condition called hemochromatosis and most don’t even know it. \n\n • Hemochromatosis is a disease that causes an iron overload and is labeled as the most common genetic disease among Caucasians. \n\n • The removal of red blood cells by phlebotomy (or donating blood) is the preferred treatment for patients with excess iron in their blood."
    
    let benefitsOfBloodDonation3 = " • Donating blood at least once a year could reduce your risk of a heart attack by 88 percent. \n\n • High levels of iron in the blood constrict your blood vessels and create more risk of a heart attack. \n\n • Depleting those extra iron deposits by donating blood gives your vessels more room to operate."
    
    let benefitsOfBloodDonation4 = " • In an average, completely healthy person, the link between giving blood and decreased cancer risk is slim. \n\n • But research does support a reduced risk of cancer for blood donors with different maladies, one of which is hemochromatosis. \n\n • Phlebotomy (the process of drawing blood) was found to be an iron-reduction method that is associated with lower cancer risk and mortality. \n\n • PAD (Peripheral Arterial Disease) patients who regularly donated blood had a lower risk of developing cancer than those who did not."
    
    let benefitsOfBloodDonation5 = " • Another danger of iron overload is the health of your liver. \n\n • In recent years, nonalcoholic fatty liver disease (NAFLD), the hepatic expression of metabolic syndrome, has reached epidemic proportions. \n\n • Research has linked too much iron with NAFLD, Hepatitis C and other liver diseases and infections. \n\n • Though there are many other factors involved in these problems, donating blood can help relieve some of those iron stores and avoid extra issues in your liver."
    
    let benefitsOfBloodDonation6 = " • Donating blood means that someone (or multiple people) somewhere will be getting the help they desperately need. \n\n • Donating blood, especially on a regular basis, can be similar to volunteer work. \n\n • You give of your time (and your literal blood) to help strangers in need. \n\n • If you go to specific blood donation location each time, you’ll get to know some of the staff who are also dedicating themselves to the cause of saving lives. \n\n • This kind of regular, altruistic interaction has major psychological benefits. \n\n • Getting out of your usual environment to do something good for someone else is stimulating in the best kind of way. \n\n • Volunteering has been shown to have positive effects on happiness. In people over 65-years-old, volunteering also reduces the risk of depression and loneliness."
    
    let benefitsOfBloodDonation7 = " • Regular blood donation reduces the weight of the donors. \n\n • This is helpful to those who are obese and are at higher risk of cardiovascular diseases and other health disorders. \n\n • According to the University of California, San Diego, you can burn approximately 650 calories per donation of one pint of blood. \n\n • However, blood donation should not be very frequent and should not be thought of as a weight loss plan - just a little extra motivation to give."
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        tableViewData = [cellData(opened: false, title: " Reveals potential health problems", sectionData: benefitsOfBloodDonation1),
                         cellData(opened: false, title: " Reduces harmful iron stores", sectionData: benefitsOfBloodDonation2),
                         cellData(opened: false, title: " Lowers risk of suffering a heart attack", sectionData: benefitsOfBloodDonation3),
                         cellData(opened: false, title: " Reduces risk of developing cancer", sectionData: benefitsOfBloodDonation4),
                         cellData(opened: false, title: " Helps liver to stay healthy", sectionData: benefitsOfBloodDonation5),
                         cellData(opened: false, title: " Gives a sense of pride", sectionData: benefitsOfBloodDonation6),
                         cellData(opened: false, title: " Burns calories", sectionData: benefitsOfBloodDonation7)]
        
        
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


