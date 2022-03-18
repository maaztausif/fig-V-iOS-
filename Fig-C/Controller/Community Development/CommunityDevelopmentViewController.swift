//
//  CommunityDevelopmentViewController.swift
//  Fig-C
//
//  Created by maaz tausif on 23/02/2022.
//

import UIKit
import Firebase
class CommunityDevelopmentViewController: UIViewController {
    var text = ""
    let db = Firestore.firestore()

    @IBOutlet weak var lblTop: UILabel!
    
    @IBOutlet weak var lblNCIPDaily: UITextField!
    @IBOutlet weak var lblIAHRACWeekly: UITextField!
    @IBOutlet weak var lblETCColor: UITextField!
    @IBOutlet weak var lblIEBOTCTrip: UITextField!
    @IBOutlet weak var lblNIEBIYAKTCProtective: UITextField!
    @IBOutlet weak var lblASKOthers: UITextField!
    @IBOutlet weak var lblFIGCCharityTakeOf: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        lblTop.text = text
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnDataClicked(_ sender: Any) {
        
            let storyBoard = UIStoryboard(name:"Main", bundle:nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "SpirtualVC") as! SpirtualVC
    //        vc.text = ItemArray[indexPath.row]
            vc.from = "CommunityDevelopment"
            self.present(vc, animated: true, completion: nil)
        
    }
    @IBAction func btnBackPressed(_ sender: Any) {
        let storyBoard = UIStoryboard(name:"Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func btnSaveClicked(_ sender: Any) {
        showUniversalLoadingView(true, loadingText: "Loading...")

        if lblNCIPDaily.text == "" || lblIAHRACWeekly.text == "" || lblETCColor.text == ""
            || lblIEBOTCTrip.text == "" || lblNIEBIYAKTCProtective.text == "" || lblASKOthers.text == ""
            || lblFIGCCharityTakeOf.text == ""{
            showAlert(inViewController: self, title: "Error!", message: "Text Field Is Missing")
        }else{
            var ref: DocumentReference? = nil
            ref = db.collection("CommunityDevelopment").addDocument(data: [
                "NCIP": "\(lblNCIPDaily.text ?? "")",
                "IAHRAC": "\(lblIAHRACWeekly.text ?? "")",
                "ETC": "\(lblETCColor.text ?? "")",
                "IEBOTC": "\(lblIEBOTCTrip.text ?? "")",
                "NIEBIYAKTC": "\(lblNIEBIYAKTCProtective.text ?? "")",
                "AKS": "\(lblASKOthers.text ?? "")",
                "FIGCCharity": "\(lblFIGCCharityTakeOf.text ?? "")"
                
                
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
