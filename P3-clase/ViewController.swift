//
//  ViewController.swift
//  P3-clase


import UIKit

class ViewController: UIViewController {
    
    
    var myBirthday : Date?
    var myLoveday : Date?
    var result : Date? //fecha de la fiesta de la media naranja
    
    
    @IBOutlet weak var lovedayLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    private let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let fechaB = defaults.object(forKey: "myBirthday") as? Date  {
            myBirthday = fechaB
        }
        if let fechaL = defaults.object(forKey: "myLoveday") as? Date {
            myLoveday = fechaL
        }
                updatebl()
                updatell()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

   func updatebl() {
        if let bd = myBirthday {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            dateFormatter.locale = Locale(identifier: "es_ES")
            let texto = dateFormatter.string(from: bd)
            birthdayLabel.text = "Nací el \(texto)"
        } else {
            birthdayLabel.text = "Fecha de nacimiento"
        }
    }
    
    
    func updatell() {
        if let ld = myLoveday {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            dateFormatter.locale = Locale(identifier: "es_ES")
            let texto = dateFormatter.string(from: ld)
            lovedayLabel.text = "Me enamoré el \(texto)"
        } else {
            lovedayLabel.text = "Fecha de enamoramiento"
        }
    }
    
    
    @IBAction func calcularButton(_ sender: UIButton) {
        algoritmo()
    }
    
   
    func algoritmo () {
        if let tbirthday = myBirthday?.timeIntervalSinceNow{
            if let tloveday = myLoveday?.timeIntervalSinceNow {
                if tloveday < tbirthday {
                    let alert = UIAlertController(title: "MAL", message: "Fechas Incoherentes", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    present(alert, animated: true)
                } else {
                    let algor = 2*(tloveday - tbirthday)
                    
                    
                    var fecha = DateComponents()
                    fecha.second = Int(algor)
                    
                    
                    let fechamn = Calendar.current.date(byAdding: fecha, to: Date())!
                    result = fechamn
                    
                    
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateStyle = .short
                    dateFormatter.timeStyle = .none
                    dateFormatter.locale = Locale(identifier: "es_ES")
                    let texto = dateFormatter.string(from: fechamn)
                    resultLabel.text = "Tu fiesta de la media naranja es el \(texto)"
                }
            } else {
                resultLabel.text = "Introduce la fecha de enamor."
            }
        } else {
            resultLabel.text = "Introduce tu cumpleaños"
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "Select Birthday":
                if let bvc = segue.destination as? BirthdayViewController {
                    if let b = myBirthday {
                        bvc.birthday = b
                    }
                    bvc.cb = {(date: Date) -> () in
                        self.myBirthday = date
                        self.updatebl()
                    }
                }
            case "Select Loveday":
                if let lvc = segue.destination as? LovedayViewController {
                    if let l = myLoveday {
                        lvc.loveday = l
                    }
                    lvc.cb = {(date: Date) -> () in
                        self.myLoveday = date
                        self.updatell()
                    }
                }
            default:
                break
            }
        }
    }
    
    @IBAction func firstPage(_ segue: UIStoryboardSegue) {
        // algoritmo()
    }
}
