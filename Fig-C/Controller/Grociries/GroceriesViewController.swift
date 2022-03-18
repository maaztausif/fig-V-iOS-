//
//  GroceriesViewController.swift
//  Fig-C
//
//  Created by maaz tausif on 22/02/2022.
//

import UIKit
import Firebase
import DateTimePicker
import UserNotifications
class GroceriesViewController: UIViewController {
    var text = ""
    let db = Firestore.firestore()
    var isPersonal = false
    
    var dateJan:Date!
    var dateFeb:Date!
    var dateMarch:Date!
    var dateApril:Date!
    var dateMay:Date!
    var dateJune:Date!
    var dateJuly:Date!
    var dateAugust:Date!
    var dateSep:Date!
    var dateOct:Date!
    var dateNov:Date!
    var dateDec:Date!

    
    let notificationCenter = UNUserNotificationCenter.current()
    let options: UNAuthorizationOptions = [.alert, .sound, .badge]

    @IBOutlet weak var lblTop: UILabel!
    
    @IBOutlet weak var lblJanuaryBudget: UITextField!
    @IBOutlet weak var lblJanuaryCost: UITextField!
    @IBOutlet weak var lblJanuaryDate: UITextField!

    @IBOutlet weak var lblFebuaryBudget: UITextField!
    @IBOutlet weak var lblFebuaryCost: UITextField!
    @IBOutlet weak var lblFebuaryDate: UITextField!
    
    @IBOutlet weak var lblMarchBudget: UITextField!
    @IBOutlet weak var lblMarchCost: UITextField!
    @IBOutlet weak var lblMarchDate: UITextField!
    
    @IBOutlet weak var lblAprilBudget: UITextField!
    @IBOutlet weak var lblAprilCost: UITextField!
    @IBOutlet weak var lblAprilDate: UITextField!
    
    @IBOutlet weak var lblMayBudget: UITextField!
    @IBOutlet weak var lblMayCost: UITextField!
    @IBOutlet weak var lblMayDate: UITextField!
    
    @IBOutlet weak var lblJuneBudget: UITextField!
    @IBOutlet weak var lblJuneCost: UITextField!
    @IBOutlet weak var lblJuneDate: UITextField!
    
    @IBOutlet weak var lblJulyBudget: UITextField!
    @IBOutlet weak var lblJulyCost: UITextField!
    @IBOutlet weak var lblJulyDate: UITextField!
    
    @IBOutlet weak var lblAugustBudget: UITextField!
    @IBOutlet weak var lblAugustCost: UITextField!
    @IBOutlet weak var lblAugustDate: UITextField!
    
    @IBOutlet weak var lblSeptemberBudget: UITextField!
    @IBOutlet weak var lblSeptemberCost: UITextField!
    @IBOutlet weak var lblSeptemberDate: UITextField!
    
    @IBOutlet weak var lblOctuberBudget: UITextField!
    @IBOutlet weak var lblOctuberCost: UITextField!
    @IBOutlet weak var lblOctuberDate: UITextField!
    
    @IBOutlet weak var lblNovemberBudget: UITextField!
    @IBOutlet weak var lblNovemberCost: UITextField!
    @IBOutlet weak var lblNovemberDate: UITextField!
    
    @IBOutlet weak var lblDecemberBudget: UITextField!
    @IBOutlet weak var lblDecemberCost: UITextField!
    @IBOutlet weak var lblDecemberDate: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        lblTop.text = text
        lblJanuaryDate.delegate = self
        lblFebuaryDate.delegate = self
        lblMarchDate.delegate = self
        lblAprilDate.delegate = self
        lblMayDate.delegate = self
        lblJuneDate.delegate = self
        lblJulyDate.delegate = self
        lblAugustDate.delegate = self
        lblSeptemberDate.delegate = self
        lblOctuberDate.delegate = self
        lblNovemberDate.delegate = self
        lblDecemberDate.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnGroceriesDataClicked(_ sender: Any) {
        if isPersonal{
            let storyBoard = UIStoryboard(name:"Main", bundle:nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "SpirtualVC") as! SpirtualVC
    //        vc.text = ItemArray[indexPath.row]
            vc.from = "Personal"
            self.present(vc, animated: true, completion: nil)
        }else{
            let storyBoard = UIStoryboard(name:"Main", bundle:nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "SpirtualVC") as! SpirtualVC
    //        vc.text = ItemArray[indexPath.row]
            vc.from = "Groceries"
            self.present(vc, animated: true, completion: nil)
        }
        
    }
    @IBAction func btnBackPressed(_ sender: Any) {
        let storyBoard = UIStoryboard(name:"Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        self.present(vc, animated: true, completion: nil)
    }

    func forNotification(){
        for_Notification(title: "Alert!", body: "Budget: Jan = \(lblJanuaryBudget.text ?? "")   ,Cost: = \(lblJanuaryCost.text ?? "")", date: dateJan)
        for_Notification(title: "Alert!", body: "Budget: Feb = \(lblFebuaryBudget.text ?? "")   ,Cost: = \(lblFebuaryCost.text ?? "")", date: dateFeb)
        for_Notification(title: "Alert!", body: "Budget: March = \(lblMarchBudget.text ?? "") ,Cost: = \(lblMarchCost.text ?? "")", date: dateMarch)
        for_Notification(title: "Alert!", body: "Budget: April = \(lblAprilBudget.text ?? "") ,Cost: = \(lblAprilCost.text ?? "")", date: dateApril)
        for_Notification(title: "Alert!", body: "Budget: May = \(lblMayBudget.text ?? "")   ,Cost: = \(lblMayCost.text ?? "")", date: dateMay)
        for_Notification(title: "Alert!", body: "Budget: June = \(lblJuneBudget.text ?? "")  ,Cost: = \(lblJuneCost.text ?? "")", date: dateJune)
        for_Notification(title: "Alert!", body: "Budget: July = \(lblJulyBudget.text ?? "")  ,Cost: = \(lblJulyCost.text ?? "")", date: dateJuly)
        for_Notification(title: "Alert!", body: "Budget: August = \(lblAugustBudget.text ?? ""),Cost: = \(lblAugustCost.text ?? "")", date: dateAugust)
        for_Notification(title: "Alert!", body: "Budget: Sep = \(lblSeptemberBudget.text ?? "")   ,Cost: = \(lblSeptemberCost.text ?? "")", date: dateSep)
        for_Notification(title: "Alert!", body: "Budget: Oct = \(lblOctuberBudget.text ?? "")   ,Cost: = \(lblOctuberCost.text ?? "")", date: dateOct)
        for_Notification(title: "Alert!", body: "Budget: Nov = \(lblNovemberBudget.text ?? "")   ,Cost: = \(lblNovemberCost.text ?? "")", date: dateNov)
        for_Notification(title: "Alert!", body: "Budget: Dec = \(lblDecemberBudget.text ?? "")   ,Cost: = \(lblDecemberCost.text ?? "")", date: dateDec)
    }
    
    @IBAction func btnSaveClicked(_ sender: Any) {

        showUniversalLoadingView(true, loadingText: "Loading...")

        if lblJanuaryBudget.text == "" || lblJanuaryCost.text == "" || lblJanuaryDate.text == ""

            || lblFebuaryBudget.text == "" || lblFebuaryCost.text == "" || lblFebuaryDate.text == ""

            || lblMarchBudget.text == "" || lblMarchCost.text == "" || lblMarchDate.text == ""

            || lblAprilBudget.text == "" || lblAprilCost.text == "" || lblAprilDate.text == ""

            || lblMayBudget.text == "" || lblMayCost.text == "" || lblMayDate.text == ""

            || lblJuneBudget.text == "" || lblJuneCost.text == "" || lblJuneDate.text == ""

            || lblJulyBudget.text == "" || lblJulyCost.text == "" || lblJulyDate.text == ""

            || lblAugustBudget.text == "" || lblAugustCost.text == "" || lblAugustDate.text == ""

            || lblSeptemberBudget.text == "" || lblSeptemberCost.text == "" || lblSeptemberDate.text == ""

            || lblOctuberBudget.text == "" || lblOctuberCost.text == "" || lblOctuberDate.text == ""

            || lblNovemberBudget.text == "" || lblNovemberCost.text == "" || lblNovemberDate.text == ""

            || lblDecemberBudget.text == "" || lblDecemberCost.text == "" || lblDecemberDate.text == ""{
            showUniversalLoadingView(false, loadingText: "")
            showAlert(inViewController: self, title: "Error!", message: "Text Field Is Missing")
        }else{
            if isPersonal{
                var ref: DocumentReference? = nil
                ref = db.collection("Personal").addDocument(data: [
                    "January": ["\(lblJanuaryBudget.text ?? "")","\(lblJanuaryCost.text ?? "")","\(lblJanuaryDate.text ?? "")"],

                    "Febuary": ["\(lblFebuaryBudget.text ?? "")","\(lblFebuaryCost.text ?? "")","\(lblFebuaryDate.text ?? "")"],

                    "March": ["\(lblMarchBudget.text ?? "")","\(lblMarchCost.text ?? "")","\(lblMarchDate.text ?? "")"],

                    "April": ["\(lblAprilBudget.text ?? "")","\(lblAprilCost.text ?? "")","\(lblAprilDate.text ?? "")"],

                    "May": ["\(lblMayBudget.text ?? "")","\(lblMayCost.text ?? "")","\(lblMayDate.text ?? "")"],

                    "June": ["\(lblJuneBudget.text ?? "")","\(lblJuneCost.text ?? "")","\(lblJuneDate.text ?? "")"],

                    "July": ["\(lblJulyBudget.text ?? "")","\(lblJulyCost.text ?? "")","\(lblJulyDate.text ?? "")"],

                    "August": ["\(lblAugustBudget.text ?? "")","\(lblAugustCost.text ?? "")","\(lblAugustDate.text ?? "")"],

                    "September": ["\(lblSeptemberBudget.text ?? "")","\(lblSeptemberCost.text ?? "")","\(lblSeptemberDate.text ?? "")",],

                    "Octuber": ["\(lblOctuberBudget.text ?? "")","\(lblOctuberCost.text ?? "")","\(lblOctuberDate.text ?? "")",],

                    "November": ["\(lblNovemberBudget.text ?? "")","\(lblNovemberCost.text ?? "")","\(lblNovemberDate.text ?? "")",],

                    "December": ["\(lblDecemberBudget.text ?? "")","\(lblDecemberCost.text ?? "")","\(lblDecemberDate.text ?? "")"]





                ]) { err in
                    if let err = err {
                        showUniversalLoadingView(false, loadingText: "")

                        print("Error adding document: \(err)")
                        showAlert(inViewController: self, title: "Error!", message: "Data is not Save")

                    } else {
                        showUniversalLoadingView(false, loadingText: "")

                        print("Document added with ID: \(ref!.documentID)")
                        self.forNotification()
                        showAlert(inViewController: self, title: "Success!", message: "Data is Save")
                    }
                }

            }else{
            var ref: DocumentReference? = nil
            ref = db.collection("Groceries").addDocument(data: [
                "January": ["\(lblJanuaryBudget.text ?? "")","\(lblJanuaryCost.text ?? "")","\(lblJanuaryDate.text ?? "")"],

                "Febuary": ["\(lblFebuaryBudget.text ?? "")","\(lblFebuaryCost.text ?? "")","\(lblFebuaryDate.text ?? "")"],

                "March": ["\(lblMarchBudget.text ?? "")","\(lblMarchCost.text ?? "")","\(lblMarchDate.text ?? "")"],

                "April": ["\(lblAprilBudget.text ?? "")","\(lblAprilCost.text ?? "")","\(lblAprilDate.text ?? "")"],

                "May": ["\(lblMayBudget.text ?? "")","\(lblMayCost.text ?? "")","\(lblMayDate.text ?? "")"],

                "June": ["\(lblJuneBudget.text ?? "")","\(lblJuneCost.text ?? "")","\(lblJuneDate.text ?? "")"],

                "July": ["\(lblJulyBudget.text ?? "")","\(lblJulyCost.text ?? "")","\(lblJulyDate.text ?? "")"],

                "August": ["\(lblAugustBudget.text ?? "")","\(lblAugustCost.text ?? "")","\(lblAugustDate.text ?? "")"],

                "September": ["\(lblSeptemberBudget.text ?? "")","\(lblSeptemberCost.text ?? "")","\(lblSeptemberDate.text ?? "")",],

                "Octuber": ["\(lblOctuberBudget.text ?? "")","\(lblOctuberCost.text ?? "")","\(lblOctuberDate.text ?? "")",],

                "November": ["\(lblNovemberBudget.text ?? "")","\(lblNovemberCost.text ?? "")","\(lblNovemberDate.text ?? "")",],

                "December": ["\(lblDecemberBudget.text ?? "")","\(lblDecemberCost.text ?? "")","\(lblDecemberDate.text ?? "")"]





            ]) { err in
                if let err = err {
                    showUniversalLoadingView(false, loadingText: "")

                    print("Error adding document: \(err)")
                    showAlert(inViewController: self, title: "Error!", message: "Data is not Save")

                } else {
                    showUniversalLoadingView(false, loadingText: "")
                    self.forNotification()
                    print("Document added with ID: \(ref!.documentID)")
                    showAlert(inViewController: self, title: "Success!", message: "Data is Save")
                }
            }
        }
    }
        
        
    }
    
    func For_DateTime(tag:Int){
        let min = Date().addingTimeInterval(-0 * 60 * 24 * 4)
        let max = Date().addingTimeInterval(1000000 * 60 * 24 * 4)
        let picker = DateTimePicker.create(minimumDate: min, maximumDate: max)
        var string:String? = ""
        picker.dateFormat = "hh:mm:ss aa dd/MM/YYYY"

        picker.includesMonth = true
        picker.highlightColor = UIColor(hexString: "5E338C")
        picker.doneButtonTitle = "DONE"
        picker.doneBackgroundColor = UIColor(hexString: "5E338C")

        picker.customFontSetting = DateTimePicker.CustomFontSetting(selectedDateLabelFont: .boldSystemFont(ofSize: 20))

        picker.completionHandler = { date in
            let formatter = DateFormatter()
            formatter.dateFormat = "hh:mm:ss aa dd/MM/YYYY"
            self.title = formatter.string(from: date)
//            self.lblBibleDay.text = self.title
            if tag == 0{
                self.lblJanuaryDate.text = self.title
                self.dateJan = date
            }else if tag == 1{
                self.lblFebuaryDate.text = self.title
                self.dateFeb = date
            }else if tag == 2{
                self.lblMarchDate.text = self.title
                self.dateMarch = date
            }else if tag == 3{
                self.lblAprilDate.text = self.title
                self.dateApril = date
            }else if tag == 4{
                self.lblMayDate.text = self.title
                self.dateMay = date
            }else if tag == 5{
                self.lblJuneDate.text = self.title
                self.dateJune = date
            }else if tag == 6{
                self.lblJulyDate.text = self.title
                self.dateJuly = date
            }else if tag == 7{
                self.lblAugustDate.text = self.title
                self.dateAugust = date
            }else if tag == 8{
                self.lblSeptemberDate.text = self.title
                self.dateSep = date
            }else if tag == 9{
                self.lblOctuberDate.text = self.title
                self.dateOct = date
            }else if tag == 10{
                self.lblNovemberDate.text = self.title
                self.dateNov = date
            }else if tag == 11{
                self.lblDecemberDate.text = self.title
                self.dateDec = date
            }
            string = self.title ?? ""
            self.title = "Add Item"
        }
        picker.delegate = self
        picker.show()
    }
    func dateTimePicker(_ picker: DateTimePicker, didSelectDate: Date) {
        title = picker.selectedDateString
        title = "Add Item"
    }
}
extension GroceriesViewController:DateTimePickerDelegate,UNUserNotificationCenterDelegate,UITextFieldDelegate{
    //MARK: Textfield delegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.For_DateTime(tag: textField.tag)
           lblJanuaryDate.resignFirstResponder()
            self.view.endEditing(true)
            return false
    }
}
