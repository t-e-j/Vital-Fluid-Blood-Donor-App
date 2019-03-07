

import UIKit


class calendarViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    //calendar was modeled after another one online
    
    let Months = ["January","Febuary", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    let daysOfMonth = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    var daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    
    var currentMonth = String()
    
    var NumEmptyBox = Int()//number of empty cells at the start of the current month
    
    var NextNumEmptyBox = Int()//next month
    var PreviousNumEmptyBox = 0//previous month
    var Direction = 0// = 0 if at current month
    var PositionIndex = 0//store vars of empty boxes
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentMonth = Months[month]
        
        monthLabel.text = "\(currentMonth), \(year)"
    }
    
    
    @IBOutlet weak var calendar: UICollectionView!
    
    @IBOutlet weak var monthLabel: UILabel!
    
    let daysToDonate = 60
    var reminderSet = 0
    
    
    
    
    
    
    @IBAction func nextMonth(_ sender: Any) {
        switch currentMonth {
        case "December":
            month = 0
            year += 1
            currentMonth = Months[month]
            monthLabel.text = "\(currentMonth), \(year)"
            calendar.reloadData()
        default:
            month += 1
            currentMonth = Months[month]
            monthLabel.text = "\(currentMonth), \(year)"
            calendar.reloadData()
        }
        
    }
    //    func getStartedDateDayPosition(){
    //        switch Direction {
    //        case 0:
    //            switch day{
    //            case 1...7:
    //                NumEmptyBox = currentweek
    //            }
    //        default:
    //            <#code#>
    //        }
    //
    //
    //    }
    
    
    
    @IBAction func previousMonth(_ sender: Any) {
        switch currentMonth {
        case "January":
            month = 11
            year -= 1
            currentMonth = Months[month]
            monthLabel.text = "\(currentMonth), \(year)"
            calendar.reloadData()
        default:
            month -= 1
            currentMonth = Months[month]
            monthLabel.text = "\(currentMonth), \(year)"
            calendar.reloadData()
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //select cell that was selected
        //calculate the day that was pressed and start a timer towards the other days
        //didnt have time to add this feature
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if daysInMonth[month] < 0 {
            daysInMonth[month] = 0
        }
        return daysInMonth[month]
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Calendar", for: indexPath) as! DateCollectionViewCell
        cell.backgroundColor = UIColor.clear
        cell.dateLabel.text = "\(indexPath.row + 1)"
        
        return cell
    }
    
    
    
}
