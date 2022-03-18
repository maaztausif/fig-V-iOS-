//
//  SpirtualMainViewController.swift
//  Fig-C
//
//  Created by maaz tausif on 21/02/2022.
//

import UIKit
import FirebaseFirestore
import DateTimePicker
import UserNotifications

class SpirtualMainViewController: UIViewController {

    @IBOutlet weak var lblTop: UILabel!
    var text = ""
    let db = Firestore.firestore()
    var user_Date:Date!
    let notificationCenter = UNUserNotificationCenter.current()
    let options: UNAuthorizationOptions = [.alert, .sound, .badge]
    @IBOutlet weak var lblBibleDay: UITextField!
    @IBOutlet weak var lblBibleNight: UITextField!
    @IBOutlet weak var lblBibleBook: UITextField!

    @IBOutlet weak var lblPraiseMorning: UITextField!
    @IBOutlet weak var lblPraiseNoon: UITextField!
    @IBOutlet weak var lblPraiseNight: UITextField!

    @IBOutlet weak var lblPrayerMorning: UITextField!
    @IBOutlet weak var lblPrayerNoon: UITextField!
    @IBOutlet weak var lblPrayerNight: UITextField!
    
    @IBOutlet weak var lblFastingDaily: UITextField!
    @IBOutlet weak var lblFastingWeekly: UITextField!
    @IBOutlet weak var lblFastingMonthly: UITextField!
    
    @IBOutlet weak var lblPetitionRequest: UITextField!
    @IBOutlet weak var lblPetitionPending: UITextField!
    @IBOutlet weak var lblPetitionAnswered: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        lblTop.text = text
//        lblBibleDay.delegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func btnDataClicked(_ sender: Any) {
        
    }
    @IBAction func btnCheckDetail(_ sender: Any) {
        let storyBoard = UIStoryboard(name:"Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "SpirtualVC") as! SpirtualVC
//        vc.text = ItemArray[indexPath.row]
        vc.from = "Spirtual"
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func btnBackPressed(_ sender: Any) {
        let storyBoard = UIStoryboard(name:"Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func btnSaveClicked(_ sender: Any) {
        showUniversalLoadingView(true, loadingText: "Loading...")
        if lblBibleDay.text == "" || lblBibleNight.text == "" || lblBibleBook.text == ""
            || lblPraiseMorning.text == "" || lblPraiseNoon.text == "" || lblPraiseNight.text == ""
            || lblPrayerMorning.text == "" || lblPrayerNoon.text == "" || lblPrayerNight.text == ""
            || lblFastingDaily.text == "" || lblFastingWeekly.text == "" || lblFastingMonthly.text == ""
            || lblPetitionRequest.text == "" || lblPetitionPending.text == "" || lblPetitionAnswered.text == ""{
            showAlert(inViewController: self, title: "Error!", message: "Text Field Is Missing")
        }else{
            var ref: DocumentReference? = nil
            ref = db.collection("Spirtual").addDocument(data: [
                "Bible": ["\(lblBibleDay.text ?? "")","\(lblBibleNight.text ?? "")","\(lblBibleBook.text ?? "")"],

                "Praise": ["\(lblPraiseMorning.text ?? "")","\(lblPraiseNoon.text ?? "")","\(lblPraiseNight.text ?? "")"],

                "Prayer": ["\(lblPrayerMorning.text ?? "")","\(lblPrayerNoon.text ?? "")","\(lblPrayerNight.text ?? "")"],

                "Fasting": ["\(lblFastingDaily.text ?? "")","\(lblFastingWeekly.text ?? "")","\(lblFastingMonthly.text ?? "")"],

                "Petition": ["\(lblPetitionRequest.text ?? "")","\(lblPetitionPending.text ?? "")","\(lblPetitionAnswered.text ?? "")"]

            ]) { err in
                if let err = err {
                    showUniversalLoadingView(false, loadingText: "")
                    print("Error adding document: \(err)")
                    showAlert(inViewController: self, title: "Error!", message: "Data is not Save")

                } else {
                    showUniversalLoadingView(false, loadingText: "")
                    print("Document added with ID: \(ref!.documentID)")
                    showAlert(inViewController: self, title: "Success!", message: "Data is Save")
                }
            }
        }
//        for_Notification(title: "asd", body: "Aaaa", date: user_Date)

        
    }

}
extension SpirtualMainViewController:DateTimePickerDelegate,UNUserNotificationCenterDelegate,UITextFieldDelegate{
    //MARK: DateTime Picker
    
    func For_DateTime(){
        let min = Date().addingTimeInterval(-0 * 60 * 24 * 4)
        let max = Date().addingTimeInterval(1000000 * 60 * 24 * 4)
        let picker = DateTimePicker.create(minimumDate: min, maximumDate: max)
        
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
            print(self.title)
            self.lblBibleDay.text = self.title
            self.user_Date = date
            self.title = "Add Item"

        }
        picker.delegate = self

        picker.show()
    }
    func dateTimePicker(_ picker: DateTimePicker, didSelectDate: Date) {
        title = picker.selectedDateString
        title = "Add Item"
    }
    
  
    
    //MARK: Textfield delegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
            self.For_DateTime()
            lblBibleDay.resignFirstResponder()
            self.view.endEditing(true)
            return false
    }

}

