//
//  BirthdayControllerViewController.swift
//  P3-clase
//
//  Created by Belen Balmori Perez-Urria on 18/10/2018.
//  Copyright © 2018 Belen Balmori Perez-Urria. All rights reserved.
//

import UIKit

class BirthdayControllerViewController: UIViewController {
    
    var birthday = Date() //El ha puesto la fecha de hoy pero no se como

    @IBOutlet weak var birthdayPicker: UIDatePicker!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        birthdayPicker.date = birthday
    }
    
    

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
