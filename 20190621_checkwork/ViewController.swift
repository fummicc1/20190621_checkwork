import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var plusButton: UIButton!
    @IBOutlet var clearButton: UIButton!
    
    var number: Int = 0
    var timer: Timer = Timer()
    var saveData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        number = saveData.integer(forKey: "number")
        label.text = String(number)
    }
    
    @IBAction func plus() {
        number += 1
        label.text = String(number)
        plusButton.layer.cornerRadius = 30
    }
    
    @IBAction func clear() {
        number = 0
        label.text = String(number)
        clearButton.layer.cornerRadius = 30
    }
    
    @IBAction func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countUp), userInfo: nil, repeats: true)
    }
    
    @objc func countUp() {
        number += 1
        label.text = String(number)
    }
    
    @IBAction func saveCount() {
        saveData.set(number, forKey: "number")
    }
}
