//
//  WhatHappensToDonatedBloodViewController.swift
//  CSC690iOS
//
//  Created by Tejasvi Belsare on 12/13/18.
//  Copyright © 2018 Tejasvi Belsare. All rights reserved.
//

import UIKit


struct cellData2 {
    
    var opened = Bool()
    var title = String()
    //    var sectionData = [String]()     /////// difference
    var sectionData = String()
    
}

class WhatHappensToDonatedBloodViewController : UITableViewController {
    
    var tableViewData = [cellData2]()
    
    //    @IBOutlet weak var titleLabel: UILabel!      ////// label Title on each cell
    let step1 = " • You arrive for your blood donation appointment. \n\n • Health history and mini physical are completed. \n\n • For a whole blood donation, about 1 pint of blood is collected; several small test tubes of blood are also collected for testing. \n\n • Your donation, test tubes and your donor record are labeled with an identical bar code label. \n\n • Your donation is kept on ice before being taken to a blood bank center for processing; the test tubes go to the lab."
    
    let step2 = " • At processing center, information about your donation is scanned into a computer database. \n\n • Most whole blood donations are spun in centrifuges to separate it into transfusable components: red cells, platelets, and plasma. \n\n • Plasma may be processed into components such as cryoprecipitate, which helps control the risk of bleeding by helping blood to clot. \n\n • Red cells and platelets are leuko-reduced, which means your white cells are removed in order to reduce the possibility of the recipient having a reaction to the transfusion. \n\n • Each component is packaged as a “unit,” a standardized amount that doctors will use when transfusing a patient."
    
    let step3 = " • In parallel with Step 2, your test tubes arrive at a testing laboratory. \n\n • A dozen tests are performed, to establish the blood type and test for infectious diseases. \n\n • Test results are transferred electronically to the processing center within 24 hours. \n\n • If a test result is positive, your donation will be discarded and you will be notified."
    
    let step4 = " • When test results are received, units suitable for transfusion are labeled and stored. \n\n • Red cells are stored in refrigerators at 6ºC for up to 42 days. \n\n • Platelets are stored at room temperature in agitators for up to five days. \n\n • Plasma and cryo are frozen and stored in freezers for up to one year."
    
    let step5 = " • Blood is available to be shipped to hospitals 24 hours a day, 7 days a week. \n\n • Hospitals typically keep some blood units on their shelves, but may call for more at any time, such as in case of large scale emergencies."
    
    let step6 = " • An ill or injured patient arrives at a hospital or treatment center. \n\n • Physicians determine whether the patient requires a transfusion and, if so, which type. \n\n • Blood transfusions are given to patients in a wide range of circumstances, including serious injuries (such as in a car crash) surgeries, child birth, anemia, blood disorders, cancer treatments, and many others. \n\n • A patient suffering from an iron deficiency or anemia may receive red blood cells to increase their hemoglobin and iron levels, improving the amount of oxygen in the body. \n\n • Patients who are unable to make enough platelets, due to illness or chemotherapy, may receive platelet transfusions to stay healthy. \n\n • Plasma transfusions are used for patients with liver failure, severe infections, and serious burns."
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        tableViewData = [cellData2(opened: false, title: " Step One - The Donation", sectionData: step1),
                         cellData2(opened: false, title: " Step Two - Processing", sectionData: step2),
                         cellData2(opened: false, title: " Step Three - Testing", sectionData: step3),
                         cellData2(opened: false, title: " Step Four - Storage", sectionData: step4),
                         cellData2(opened: false, title: " Step Five - Distribution", sectionData: step5),
                         cellData2(opened: false, title: " Step Six - Transfusion", sectionData: step6)]
        
        
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

