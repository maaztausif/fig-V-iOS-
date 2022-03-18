//
//  GiftViewController.swift
//  Fig-C
//
//  Created by maaz tausif on 22/02/2022.
//

import UIKit
import Firebase
import DateTimePicker
import UserNotifications
class GiftViewController: UIViewController, DateTimePickerDelegate {

    
    var text = ""
    let db = Firestore.firestore()
    var isPersonal = false
    
    var dateWed:Date!
    var dateBirth:Date!
    var dateFuneral:Date!
    var dateCharity:Date!
    var dateChrist:Date!
    var dateSpecial:Date!
    @IBOutlet weak var lblTop: UILabel!
    
    @IBOutlet weak var lblWeddingName: UITextField!
    @IBOutlet weak var lblWeddingDate: UITextField!
    @IBOutlet weak var lblWeddingPrice: UITextField!

    @IBOutlet weak var lblBirthdayName: UITextField!
    @IBOutlet weak var lblBirthdayDate: UITextField!
    @IBOutlet weak var lblBirthdayPrice: UITextField!
    
    @IBOutlet weak var lblFuneralsName: UITextField!
    @IBOutlet weak var lblFuneralsDate: UITextField!
    @IBOutlet weak var lblFuneralsPrice: UITextField!
    
    @IBOutlet weak var lblCharityName: UITextField!
    @IBOutlet weak var lblCharityDate: UITextField!
    @IBOutlet weak var lblCharityPrice: UITextField!
    
    @IBOutlet weak var lblChristmasName: UITextField!
    @IBOutlet weak var lblChristmasDate: UITextField!
    @IBOutlet weak var lblChristmasPrice: UITextField!
    
    @IBOutlet weak var lblSpecialName: UITextField!
    @IBOutlet weak var lblSpecialDate: UITextField!
    @IBOutlet weak var lblSpecialPrice: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTop.text = text
        lblSpecialDate.delegate = self
        lblChristmasDate.delegate = self
        lblFuneralsDate.delegate = self
        lblBirthdayDate.delegate = self
        lblWeddingDate.delegate = self
        lblCharityDate.delegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func btnCheckDetail(_ sender: Any) {
        let storyBoard = UIStoryboard(name:"Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "SpirtualVC") as! SpirtualVC
//        vc.text = ItemArray[indexPath.row]
        vc.from = "Gift"
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func btnBackPressed(_ sender: Any) {
        let storyBoard = UIStoryboard(name:"Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func btnSaveClicked(_ sender: Any) {
        
      
        showUniversalLoadingView(true, loadingText: "Loading...")

        if lblWeddingName.text == "" || lblWeddingDate.text == "" || lblWeddingPrice.text == ""

            || lblBirthdayName.text == "" || lblBirthdayDate.text == "" || lblBirthdayPrice.text == ""

            || lblFuneralsName.text == "" || lblFuneralsDate.text == "" || lblFuneralsPrice.text == ""

            || lblCharityName.text == "" || lblCharityDate.text == "" || lblCharityPrice.text == ""

            || lblChristmasName.text == "" || lblChristmasDate.text == "" || lblChristmasPrice.text == ""

            || lblSpecialName.text == "" || lblSpecialDate.text == "" || lblSpecialPrice.text == ""{
            showUniversalLoadingView(false, loadingText: "")

            showAlert(inViewController: self, title: "Error!", message: "Text Field Is Missing")
        }else{
            var ref: DocumentReference? = nil
            ref = db.collection("Gift").addDocument(data: [
                "Wedding": ["\(lblWeddingName.text ?? "")","\(lblWeddingDate.text ?? "")","\(lblWeddingPrice.text ?? "")"],

                "Birthday": ["\(lblBirthdayName.text ?? "")","\(lblBirthdayDate.text ?? "")","\(lblBirthdayPrice.text ?? "")"],

                "Funeral": ["\(lblFuneralsName.text ?? "")","\(lblFuneralsDate.text ?? "")","\(lblFuneralsPrice.text ?? "")"],

                "Charity": ["\(lblCharityName.text ?? "")","\(lblCharityDate.text ?? "")","\(lblCharityPrice.text ?? "")"],

                "Christmas": ["\(lblChristmasName.text ?? "")","\(lblChristmasDate.text ?? "")","\(lblChristmasPrice.text ?? "")"],

                "Special": ["\(lblSpecialName.text ?? "")","\(lblSpecialDate.text ?? "")","\(lblSpecialPrice.text ?? "")"]

            ]) { err in
                if let err = err {
                    showUniversalLoadingView(false, loadingText: "")
                    print("Error adding document: \(err)")
                    showAlert(inViewController: self, title: "Error!", message: "Data is not Save")

                } else {
                    showUniversalLoadingView(false, loadingText: "")
                    print("Document added with ID: \(ref!.documentID)")
                    self.notification()
                    showAlert(inViewController: self, title: "Success!", message: "Data is Save")
                }
            }
        }

        
    }
    func notification(){
        for_Notification(title: "Weding", body: "Name: \(lblWeddingName.text ?? "")   ,Price: \(lblWeddingPrice.text ?? "")", date: dateWed)
        for_Notification(title: "Birthday!", body: "Name: \(lblBirthdayName.text ?? "")   ,Price: \(lblBirthdayPrice.text ?? "")", date: dateBirth)
        for_Notification(title: "Funeral!", body: "Name: \(lblFuneralsName.text ?? "") ,Price: \(lblFuneralsPrice.text ?? "")", date: dateFuneral)
        for_Notification(title: "Charity!", body: "Name: \(lblCharityName.text ?? "") ,Price: \(lblCharityPrice.text ?? "")", date: dateCharity)
        for_Notification(title: "Christmas!", body: "Name: \(lblChristmasName.text ?? "")   ,Price: \(lblChristmasPrice.text ?? "")", date: dateChrist)
        for_Notification(title: "Special!", body: "Name: \(lblSpecialName.text ?? "")  ,Price: \(lblSpecialPrice.text ?? "")", date: dateSpecial)
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
                self.lblWeddingDate.text = self.title
                self.dateWed = date
            }else if tag == 1{
                self.lblBirthdayDate.text = self.title
                self.dateBirth = date
            }else if tag == 2{
                self.lblFuneralsDate.text = self.title
                self.dateFuneral = date
            }else if tag == 3{
                self.lblCharityDate.text = self.title
                self.dateCharity = date
            }else if tag == 4{
                self.lblChristmasDate.text = self.title
                self.dateChrist = date
            }else if tag == 5{
                self.lblSpecialDate.text = self.title
                self.dateSpecial = date
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
 
extension GiftViewController:UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.For_DateTime(tag: textField.tag)
           lblWeddingDate.resignFirstResponder()
            self.view.endEditing(true)
            return false
    }
}
