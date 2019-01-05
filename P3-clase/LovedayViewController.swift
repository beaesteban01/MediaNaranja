//
//  LovedayViewController.swift
//  P3-clase
//

import UIKit

class LovedayViewController: UIViewController {
    
    
    var loveday = Date()
    var cb: ((Date) -> ())?

    @IBOutlet weak var lovedayPicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        if let fechaPrev = defaults.object(forKey: "myLoveday") as? Date {
            lovedayPicker.date = fechaPrev
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let defaults = UserDefaults.standard
        defaults.set(lovedayPicker.date, forKey: "myLoveday")
        defaults.synchronize()
    }
    

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "ld ok" {
            if lovedayPicker.date > Date() {
                let alert = UIAlertController(title: "MAL", message: "Fecha Imposible", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                present(alert, animated: true)
                return false
            }
        }
        return true
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ld ok" {
            // loveday = lovedayPicker.date
            cb?(lovedayPicker.date)
        } else {}
    }
}

    

   
    
    


