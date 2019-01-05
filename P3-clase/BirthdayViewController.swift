//
//  BirthdayViewController.swift
//  P3-clase
//
//  Created by Belen Balmori Perez-Urria on 19/10/2018.
//  Copyright © 2018 Belen Balmori Perez-Urria. All rights reserved.
//

import UIKit

class BirthdayViewController: UIViewController {
    
    
    var birthday = Date()
    var cb: ((Date) -> ())?
    
    
    @IBOutlet weak var birthdayPicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        if let fechaPrev = defaults.object(forKey: "myBirthday") as? Date {
            birthdayPicker.date = fechaPrev
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let defaults = UserDefaults.standard
        defaults.set(birthdayPicker.date, forKey: "myBirthday")
        defaults.synchronize()
    }
    
    
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "sb ok" {
            if birthdayPicker.date > Date() {
                let alert = UIAlertController(title: "MAL", message: "Fecha Imposible", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                present(alert, animated: true)
                return false
            }
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sb ok" {
            cb?(birthdayPicker.date)
        } else {}
        
        
    }
    
    
    
}
