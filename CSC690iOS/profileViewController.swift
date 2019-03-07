
import UIKit

class profileViewController: UIViewController {
    
    
    var userName = ""
    var userAge = ""
    var userBloodType = ""
    var userLocation = ""
    
    
    
    //user input
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var ageInput: UITextField!
    @IBOutlet weak var bloodTypeInput: UITextField!
    @IBOutlet weak var locationInput: UITextField!
    
    
    //displayed output
    @IBOutlet weak var nameOutput: UILabel!
    @IBOutlet weak var ageOutput: UILabel!
    @IBOutlet weak var bloodTypeOutput: UILabel!
    @IBOutlet weak var locationOutput: UILabel!
    
    
    
    
    @IBAction func saveButton(_ sender: Any) {
        
        guard let userName = nameInput.text,
            let userAge = ageInput.text,
            let userBloodType = bloodTypeInput.text,
            let userLocation = locationInput.text
            else{
                return
        }
        
        nameOutput.text = userName
        ageOutput.text = userAge
        bloodTypeOutput.text = userBloodType
        locationOutput.text = userLocation
        
        
        //save fields of input
        UserDefaults.standard.set(userName, forKey: "userName")
        UserDefaults.standard.set(userAge, forKey: "userAge")
        UserDefaults.standard.set(userBloodType, forKey: "userBloodType")
        UserDefaults.standard.set(userLocation, forKey: "userLocation")
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameOutput.text = UserDefaults.standard.string(forKey: "userName")
        ageOutput.text = UserDefaults.standard.string(forKey: "userAge")
        bloodTypeOutput.text = UserDefaults.standard.string(forKey: "userBloodType")
        locationOutput.text = UserDefaults.standard.string(forKey: "userLocation")
        
        
        
    }
    
    
    
    
}
