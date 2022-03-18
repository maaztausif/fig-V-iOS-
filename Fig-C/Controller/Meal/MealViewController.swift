//
//  MealViewController.swift
//  Fig-C
//
//  Created by maaz tausif on 23/02/2022.
//

import UIKit
import Firebase
class MealViewController: UIViewController {
    var text = ""
    let db = Firestore.firestore()
    @IBOutlet weak var lblTop: UILabel!
    
    @IBOutlet weak var lblBreakfastDaily: UITextField!
    @IBOutlet weak var lblLunchWeekly: UITextField!
    @IBOutlet weak var lblDinnerColor: UITextField!
    @IBOutlet weak var lblSnackTrip: UITextField!
    @IBOutlet weak var lblDrinkProtective: UITextField!
    @IBOutlet weak var lblIntermittentFastingOthers: UITextField!

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
    @IBAction func btnDataClicked(_ sender: Any) {
        let storyBoard = UIStoryboard(name:"Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "SpirtualVC") as! SpirtualVC
//        vc.text = ItemArray[indexPath.row]
        vc.from = "Meal"
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func btnSaveClicked(_ sender: Any) {
        showUniversalLoadingView(true, loadingText: "Loading...")
        if lblBreakfastDaily.text == ""
            || lblLunchWeekly.text == ""
            || lblDinnerColor.text == ""
            || lblSnackTrip.text == ""
            || lblDrinkProtective.text == ""
            || lblIntermittentFastingOthers.text == ""{
            showUniversalLoadingView(false, loadingText: "")

            showAlert(inViewController: self, title: "Error!", message: "Text Field Is Missing")
        }else{
            var ref: DocumentReference? = nil
            ref = db.collection("Meal").addDocument(data: [
                "Breakfast": "\(lblBreakfastDaily.text ?? "")",
                "Lunch": "\(lblLunchWeekly.text ?? "")",
                "Dinner": "\(lblDinnerColor.text ?? "")",
                "Snack": "\(lblSnackTrip.text ?? "")",
                "Drinks": "\(lblDrinkProtective.text ?? "")",
                "Intermittent Fasting": "\(lblIntermittentFastingOthers.text ?? "")",
                
                
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
