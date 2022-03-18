//
//  WorkViewController.swift
//  Fig-C
//
//  Created by maaz tausif on 22/02/2022.
//

import UIKit
import FirebaseFirestore
class WorkViewController: UIViewController {
    var text = ""
    @IBOutlet weak var lblTop: UILabel!
    let db = Firestore.firestore()

    @IBOutlet weak var lblSundayRest: UITextField!
    @IBOutlet weak var lblSundayPlan: UITextField!
    @IBOutlet weak var lblSundayPrepare: UITextField!
    
    @IBOutlet weak var lblMondayStart: UITextField!
    @IBOutlet weak var lblMondayStop: UITextField!
    @IBOutlet weak var lblMondayBreaks: UITextField!
    
    @IBOutlet weak var lblTuesdayStart: UITextField!
    @IBOutlet weak var lblTuesdayStop: UITextField!
    @IBOutlet weak var lblTuesdayBreaks: UITextField!
    
    @IBOutlet weak var lblWednesdayStart: UITextField!
    @IBOutlet weak var lblWednesdayStop: UITextField!
    @IBOutlet weak var lblWednesdayBreaks: UITextField!
    
    @IBOutlet weak var lblThursdayStart: UITextField!
    @IBOutlet weak var lblThursdayStop: UITextField!
    @IBOutlet weak var lblThursdayBreaks: UITextField!
    
    @IBOutlet weak var lblFridayStart: UITextField!
    @IBOutlet weak var lblFridayStop: UITextField!
    @IBOutlet weak var lblFridayBreaks: UITextField!
    
    @IBOutlet weak var lblSaturdayStart: UITextField!
    @IBOutlet weak var lblSaturdayStop: UITextField!
    @IBOutlet weak var lblSaturdayBreaks: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        lblTop.text = text
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBackPressed(_ sender: Any) {
        let storyBoard = UIStoryboard(name:"Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func btnWorkedDataClicked(_ sender: Any) {
        let storyBoard = UIStoryboard(name:"Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "SpirtualVC") as! SpirtualVC
//        vc.text = ItemArray[indexPath.row]
        vc.from = "Work"
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func btnSaveClicked(_ sender: Any) {
        showUniversalLoadingView(true, loadingText: "Loading...")

        if lblSundayRest.text == "" || lblSundayPlan.text == "" || lblSundayPrepare.text == ""
            || lblMondayStart.text == "" || lblMondayStop.text == "" || lblMondayBreaks.text == ""
            || lblTuesdayStart.text == "" || lblTuesdayStop.text == "" || lblTuesdayBreaks.text == ""
            || lblWednesdayStart.text == "" || lblWednesdayStop.text == "" || lblWednesdayBreaks.text == ""
            || lblThursdayStart.text == "" || lblThursdayStop.text == "" || lblThursdayBreaks.text == ""
            || lblFridayStart.text == "" || lblFridayStop.text == "" || lblFridayBreaks.text == ""
            || lblSaturdayStart.text == "" || lblSaturdayStop.text == "" || lblSaturdayBreaks.text == ""{
            showAlert(inViewController: self, title: "Error!", message: "Text Field Is Missing")
        }else{
            var ref: DocumentReference? = nil
            ref = db.collection("Work").addDocument(data: [
                "Sunday": ["\(lblSundayRest.text ?? "")","\(lblSundayPlan.text ?? "")","\(lblSundayPrepare.text ?? "")"],
                
                "Monday": ["\(lblMondayStart.text ?? "")","\(lblMondayStop.text ?? "")","\(lblMondayBreaks.text ?? "")"],
                
                "Tuesday": ["\(lblTuesdayStart.text ?? "")","\(lblTuesdayStop.text ?? "")","\(lblTuesdayBreaks.text ?? "")"],
                
                "Wednesday": ["\(lblWednesdayStart.text ?? "")","\(lblWednesdayStop.text ?? "")","\(lblWednesdayBreaks.text ?? "")"],
                
                "Thursday": ["\(lblThursdayStart.text ?? "")","\(lblThursdayStop.text ?? "")","\(lblThursdayBreaks.text ?? "")"],
                
                "Friday": ["\(lblFridayStart.text ?? "")","\(lblFridayStop.text ?? "")","\(lblFridayBreaks.text ?? "")"],
                
                "Saturday": ["\(lblSaturdayStart.text ?? "")","\(lblSaturdayStop.text ?? "")","\(lblSaturdayBreaks.text ?? "")"]
                
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
        
        
    }
}
