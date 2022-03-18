//
//  HolidayViewController.swift
//  Fig-C
//
//  Created by maaz tausif on 23/02/2022.
//

import UIKit
import Firebase
class HolidayViewController: UIViewController {
    var text = ""
    let db = Firestore.firestore()

    @IBOutlet weak var lblTop: UILabel!
    
    @IBOutlet weak var lblLocationWhere: UITextField!
    @IBOutlet weak var lblLocationDocuments: UITextField!
    @IBOutlet weak var lblLocationAnnualLeave: UITextField!

    @IBOutlet weak var lblDateOutBound: UITextField!
    @IBOutlet weak var lblDateInbound: UITextField!
    
    @IBOutlet weak var lblModeAir: UITextField!
    @IBOutlet weak var lblModeLand: UITextField!
    @IBOutlet weak var lblModeAnnualSea: UITextField!
    
    @IBOutlet weak var lblSightSeeing: UITextField!

    @IBOutlet weak var lblTravelWigs: UITextField!

    @IBOutlet weak var lblCasesOthers: UITextField!

    @IBOutlet weak var lblHandLuggageTakeOf: UITextField!

    @IBOutlet weak var lblMiscellaneousPedicure: UITextField!


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
            vc.from = "Holiday"
            self.present(vc, animated: true, completion: nil)
        
    }
    @IBAction func btnSaveClicked(_ sender: Any) {
        showUniversalLoadingView(true, loadingText: "Loading...")

        if lblLocationWhere.text == "" || lblLocationDocuments.text == "" || lblLocationAnnualLeave.text == ""
            || lblDateOutBound.text == "" || lblDateInbound.text == ""
            || lblModeAir.text == "" || lblModeLand.text == "" || lblModeAnnualSea.text == ""
            || lblSightSeeing.text == ""
            || lblTravelWigs.text == ""
            || lblCasesOthers.text == ""
            || lblHandLuggageTakeOf.text == ""
            || lblHandLuggageTakeOf.text == ""
            || lblMiscellaneousPedicure.text == ""{
            showUniversalLoadingView(false, loadingText: "")

            showAlert(inViewController: self, title: "Error!", message: "Text Field Is Missing")
        }else{
            var ref: DocumentReference? = nil
            ref = db.collection("Holiday").addDocument(data: [
                "Location": ["\(lblLocationWhere.text ?? "")","\(lblLocationDocuments.text ?? "")","\(lblLocationAnnualLeave.text ?? "")"],
                
                "Date": ["\(lblDateOutBound.text ?? "")","\(lblDateInbound.text ?? "")",""],
                
                "Mode": ["\(lblModeAir.text ?? "")","\(lblModeLand.text ?? "")","\(lblModeAnnualSea.text ?? "")"],
                
                "Sight Seeing": ["\(lblSightSeeing.text ?? "")","",""],
                "Travel": ["\(lblTravelWigs.text ?? "")","",""],
                "Cases": ["\(lblCasesOthers.text ?? "")","",""],
                "Hand luggage": ["\(lblHandLuggageTakeOf.text ?? "")","",""],
                "Miscellaneous": ["\(lblMiscellaneousPedicure.text ?? "")","",""]
                
                
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
