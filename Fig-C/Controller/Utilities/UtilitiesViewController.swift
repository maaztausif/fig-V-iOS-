//
//  UtilitiesViewController.swift
//  Fig-C
//
//  Created by maaz tausif on 22/02/2022.
//

import UIKit
import Firebase
import DateTimePicker
import UserNotifications
class UtilitiesViewController: UIViewController,DateTimePickerDelegate {
    var text = ""
    let db = Firestore.firestore()
    var dateGas:Date!
    var dateWater:Date!
    var dateElectricity:Date!
    var dateCouncil:Date!
    var dateTv:Date!
    @IBOutlet weak var lblTop: UILabel!
    
    
    @IBOutlet weak var lblPhoneMobile: UITextField!
    @IBOutlet weak var lblPhonePhonecard: UITextField!
    @IBOutlet weak var lblPhonePad: UITextField!
    
    @IBOutlet weak var lblGasDue: UITextField!
    @IBOutlet weak var lblGasPlan: UITextField!
    @IBOutlet weak var lblGasPaid: UITextField!

    @IBOutlet weak var lblWaterDue: UITextField!
    @IBOutlet weak var lblWaterPlan: UITextField!
    @IBOutlet weak var lblWaterPaid: UITextField!
    
    @IBOutlet weak var lblElectricityDue: UITextField!
    @IBOutlet weak var lblElectricityPlan: UITextField!
    @IBOutlet weak var lblElectricityPaid: UITextField!
    
    @IBOutlet weak var lblCouncilTextDue: UITextField!
    @IBOutlet weak var lblCouncilTextPlan: UITextField!
    @IBOutlet weak var lblCouncilTextPaid: UITextField!
    
    @IBOutlet weak var lblTvLicenseDue: UITextField!
    @IBOutlet weak var lblTvLicensePlan: UITextField!
    @IBOutlet weak var lblTvLicensePaid: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTop.text = text
        lblGasDue.delegate = self
        lblElectricityDue.delegate = self
        lblWaterDue.delegate = self
        lblCouncilTextDue.delegate = self
        lblTvLicenseDue.delegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func btnCheckDetail(_ sender: Any) {
        let storyBoard = UIStoryboard(name:"Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "SpirtualVC") as! SpirtualVC
//        vc.text = ItemArray[indexPath.row]
        vc.from = "Utilities"
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func btnBackPressed(_ sender: Any) {
        let storyBoard = UIStoryboard(name:"Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func btnSaveClicked(_ sender: Any) {
        
        showUniversalLoadingView(true, loadingText: "Loading...")

        if lblPhoneMobile.text == "" || lblPhonePhonecard.text == "" || lblPhonePad.text == ""

            || lblGasDue.text == "" || lblGasPlan.text == "" || lblGasPaid.text == ""

            || lblWaterDue.text == "" || lblWaterPlan.text == "" || lblWaterPaid.text == ""

            || lblElectricityDue.text == "" || lblElectricityPlan.text == "" || lblElectricityPaid.text == ""

            || lblCouncilTextDue.text == "" || lblCouncilTextPlan.text == "" || lblCouncilTextPaid.text == ""

            || lblTvLicenseDue.text == "" || lblTvLicensePlan.text == "" || lblTvLicensePaid.text == ""{
            showUniversalLoadingView(false, loadingText: "")

            showAlert(inViewController: self, title: "Error!", message: "Text Field Is Missing")
        }else{
            var ref: DocumentReference? = nil
            ref = db.collection("Utilities").addDocument(data: [
                "Phone": ["\(lblPhoneMobile.text ?? "")","\(lblPhonePhonecard.text ?? "")","\(lblPhonePad.text ?? "")"],

                "Gas": ["\(lblGasDue.text ?? "")","\(lblGasPlan.text ?? "")","\(lblGasPaid.text ?? "")"],

                "Water": ["\(lblWaterDue.text ?? "")","\(lblWaterPlan.text ?? "")","\(lblWaterPaid.text ?? "")"],

                "Electricity": ["\(lblElectricityDue.text ?? "")","\(lblElectricityPlan.text ?? "")","\(lblElectricityPaid.text ?? "")"],

                "Council Tax": ["\(lblCouncilTextDue.text ?? "")","\(lblCouncilTextPlan.text ?? "")","\(lblCouncilTextPaid.text ?? "")"],

                "Tv License": ["\(lblTvLicenseDue.text ?? "")","\(lblTvLicensePlan.text ?? "")","\(lblTvLicensePaid.text ?? "")"]

            ]) { err in
                if let err = err {
                    showUniversalLoadingView(false, loadingText: "")

                    print("Error adding document: \(err)")
                    showAlert(inViewController: self, title: "Error!", message: "Data is not Save")

                } else {
                    showUniversalLoadingView(false, loadingText: "")
                    self.notification()
                    print("Document added with ID: \(ref!.documentID)")
                    showAlert(inViewController: self, title: "Success!", message: "Data is Save")
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
                self.lblGasDue.text = self.title
                self.dateGas = date
            }else if tag == 1{
                self.lblWaterDue.text = self.title
                self.dateWater = date
            }else if tag == 2{
                self.lblElectricityDue.text = self.title
                self.dateElectricity = date
            }else if tag == 3{
                self.lblCouncilTextDue.text = self.title
                self.dateCouncil = date
            }else if tag == 4{
                self.lblTvLicenseDue.text = self.title
                self.dateTv = date
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
    
    func notification(){
        for_Notification(title: "Gas", body: "Plan: \(lblGasPlan.text ?? "")   ,Paid: \(lblGasPaid.text ?? "")", date: dateGas)
        for_Notification(title: "Water!", body: "Plan: \(lblWaterPlan.text ?? "")   ,Paid: \(lblWaterPaid.text ?? "")", date: dateWater)
        for_Notification(title: "Electricity!", body: "Plan: \(lblElectricityPlan.text ?? "") ,Paid: \(lblElectricityPaid.text ?? "")", date: dateElectricity)
        for_Notification(title: "Council!", body: "Plan: \(lblCouncilTextPlan.text ?? "") ,Paid: \(lblCouncilTextPaid.text ?? "")", date: dateCouncil)
        for_Notification(title: "Tv!", body: "Plan: \(lblTvLicensePlan.text ?? "")   ,Paid: \(lblTvLicensePaid.text ?? "")", date: dateTv)
    }
}
extension UtilitiesViewController:UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.For_DateTime(tag: textField.tag)
           lblGasDue.resignFirstResponder()
            self.view.endEditing(true)
            return false
    }
}
