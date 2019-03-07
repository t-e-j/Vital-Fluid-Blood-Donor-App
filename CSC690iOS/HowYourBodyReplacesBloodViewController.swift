//
//  HowYourBodyReplacesBloodViewController.swift
//  CSC690iOS
//
//  Created by Tejasvi Belsare on 12/13/18.
//  Copyright © 2018 Tejasvi Belsare. All rights reserved.
//

import UIKit


struct cellData3 {
    
    var opened = Bool()
    var title = String()
    //    var sectionData = [String]()     /////// difference
    var sectionData = String()
    
}

class HowYourBodyReplacesBloodViewController : UITableViewController {
    
    var tableViewData = [cellData3]()
    
    //    @IBOutlet weak var titleLabel: UILabel!      ////// label Title on each cell
    let bloodReplacement1 = " • Millions of red blood cells are being made and dying every second. When you give blood you lose red cells and the body needs to make more to replace them. Special cells in the kidneys, called peritubular cells, sense that the level of oxygen in the blood has decreased (due to the loss of red cells) and start secreting a protein called erythropoietin. This passes through the bloodstream until it reaches the bone marrow (the soft fatty tissue inside the bone cavities). \n\n • The bone marrow produces stem cells, the building blocks that the body uses to make the different blood cells – red cells, white cells and platelets. The erythropoietin sends a message to the stem cells telling more of them to develop into red blood cells, rather than white cells or platelets."
    
    let bloodReplacement2 = " • Your body makes about 2 million new red cells every second, so it only takes a number of weeks to build up stores of them again. \n\n • What about your white cells and platelets? A number of other messenger proteins also stimulate the production of these cells in the bone marrow, and over the next few days levels return to normal."
    
    let bloodReplacement3 = " • Male donors need to wait a minimum of 12 weeks between whole blood donations and female donors 16 weeks. So why wait? Unlike white cells and platelets, it takes several weeks for all the red cells to be replaced.\n\n • There's an important link between your red cells and your health because it's these cells, or rather the red-coloured haemoglobin they contain, that take oxygen around your body. Haemoglobin contains iron, and some is lost with each blood donation. To compensate, iron is mobilised from the body's iron stores, and the body also increases the amount of iron it absorbs from food and drink. Men normally have more iron stores than women."
    
    let bloodReplacement4 = " • Before every blood donation we always test your haemoglobin levels. We make sure that your haemoglobin level is above 125g/l for women and 135g/l for men. This is because any iron deficiency can result in reduced haemoglobin levels, and eventually, if not treated, in iron deficiency anaemia. This deficiency can make you feel tired. "
    
    let bloodReplacement5 = " • The body stores iron in the form of 2 proteins – ferritin (in men it accounts for about 70% of stored iron, in women 80%) and haemosiderin. The proteins are found in the liver, bone marrow, spleen and muscles. If too much iron is taken out of storage and not replaced through dietary sources, iron stores may become depleted and haemoglobin levels fall. \n\n • After a donation, most people's haemoglobin levels are back to normal after 6 to 12 weeks. This is why we ask donors to wait for a minimum of 12 weeks between donations (12 weeks for men and 16 weeks for women) to ensure that we don’t risk lowering your haemoglobin levels over the long term."
    
    let bloodReplacement6 = " • Blood volume makes up approximately 8% of your body weight. About 55% of blood is comprised of plasma, of which 90% is water. So, although you donate less than a pint of blood at a time, almost half of this is water. That's why it is important for you to drink plenty of water before you donate and immediately after you've donated.\n\n • It's important to replace fluids after you've donated, to help bring your blood volume levels back to normal. The kidneys also play their part in controlling blood volume by regulating the amount of sodium and water lost in urine."
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        tableViewData = [cellData3(opened: false, title: " Red blood cells", sectionData: bloodReplacement1),
                         cellData3(opened: false, title: " How fast does your body make blood?", sectionData: bloodReplacement2),
                         cellData3(opened: false, title: " How long between blood donations?", sectionData: bloodReplacement3),
                         cellData3(opened: false, title: " Your haemoglobin levels", sectionData: bloodReplacement4),
                         cellData3(opened: false, title: " Your iron levels", sectionData: bloodReplacement5),
                         cellData3(opened: false, title: " Drink up", sectionData: bloodReplacement6)]
        
        
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


