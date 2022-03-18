//
//  BudgetViewController.swift
//  Fig-C
//
//  Created by maaz tausif on 23/02/2022.
//

import UIKit
import Firebase
class BudgetViewController: UIViewController {
    var text = ""
    let db = Firestore.firestore()

    @IBOutlet weak var lblTop: UILabel!
    
    @IBOutlet weak var lblCarCost: UITextField!
    @IBOutlet weak var lblCarSaving: UITextField!
    @IBOutlet weak var lblCarComplete: UITextField!
    
    @IBOutlet weak var lblBedroomCost: UITextField!
    @IBOutlet weak var lblBedroomSaving: UITextField!
    @IBOutlet weak var lblBedroomComplete: UITextField!
    
    @IBOutlet weak var lblStudioCost: UITextField!
    @IBOutlet weak var lblStudioSaving: UITextField!
    @IBOutlet weak var lblStudioComplete: UITextField!
    
    @IBOutlet weak var lblGardenCost: UITextField!
    @IBOutlet weak var lblGardenSaving: UITextField!
    @IBOutlet weak var lblGardenComplete: UITextField!
    
    @IBOutlet weak var lblHomeOfficeCost: UITextField!
    @IBOutlet weak var lblHomeOfficeSaving: UITextField!
    @IBOutlet weak var lblHomeOfficeComplete: UITextField!
    
    @IBOutlet weak var lblPropertyCost: UITextField!
    @IBOutlet weak var lblPropertySaving: UITextField!
    @IBOutlet weak var lblPropertyComplete: UITextField!
    
    @IBOutlet weak var lblPersonalDevelopmentCost: UITextField!
    @IBOutlet weak var lblPersonalDevelopmentSaving: UITextField!
    @IBOutlet weak var lblPersonalDevelopmentComplete: UITextField!

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
        vc.from = "Budget"
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func btnSaveClicked(_ sender: Any) {
        showUniversalLoadingView(true, loadingText: "Loading...")
        if lblCarCost.text == "" || lblCarSaving.text == "" || lblCarComplete.text == ""
            || lblBedroomCost.text == "" || lblBedroomSaving.text == "" || lblBedroomComplete.text == ""
            || lblStudioCost.text == "" || lblStudioSaving.text == "" || lblStudioComplete.text == ""
            || lblGardenCost.text == "" || lblGardenSaving.text == "" || lblGardenComplete.text == ""
            || lblHomeOfficeCost.text == "" || lblHomeOfficeSaving.text == "" || lblHomeOfficeComplete.text == ""
            || lblPropertyCost.text == "" || lblPropertySaving.text == "" || lblPropertyComplete.text == ""
            || lblPersonalDevelopmentCost.text == "" || lblPersonalDevelopmentSaving.text == "" && lblPersonalDevelopmentComplete.text == ""{
            showUniversalLoadingView(false, loadingText: "")
            showAlert(inViewController: self, title: "Error!", message: "Text Field Is Missing")
        }else{
            var ref: DocumentReference? = nil
            ref = db.collection("Budget").addDocument(data: [
                "Car": ["\(lblCarCost.text ?? "")","\(lblCarSaving.text ?? "")","\(lblCarComplete.text ?? "")"],
                
                "Bedroom": ["\(lblBedroomCost.text ?? "")","\(lblBedroomSaving.text ?? "")","\(lblBedroomComplete.text ?? "")"],
                
                "Studio": ["\(lblStudioCost.text ?? "")","\(lblStudioSaving.text ?? "")","\(lblStudioComplete.text ?? "")"],
                
                "Garden": ["\(lblGardenCost.text ?? "")","\(lblGardenSaving.text ?? "")","\(lblGardenComplete.text ?? "")"],
                
                "Home": ["\(lblHomeOfficeCost.text ?? "")","\(lblHomeOfficeSaving.text ?? "")","\(lblHomeOfficeComplete.text ?? "")"],
                
                "Property": ["\(lblPropertyCost.text ?? "")","\(lblPropertySaving.text ?? "")","\(lblPropertyComplete.text ?? "")"],
                
                "PersonalDevelopment": ["\(lblPersonalDevelopmentCost.text ?? "")","\(lblPersonalDevelopmentSaving.text ?? "")","\(lblPersonalDevelopmentComplete.text ?? "")"]
                
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
