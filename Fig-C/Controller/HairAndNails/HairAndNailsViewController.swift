//
//  HairAndNailsViewController.swift
//  Fig-C
//
//  Created by maaz tausif on 21/02/2022.
//

import UIKit
import FirebaseFirestore
import Firebase
class HairAndNailsViewController: UIViewController {

    @IBOutlet weak var lblTop: UILabel!
    var text = ""
    let db = Firestore.firestore()
    
 
    
    @IBOutlet weak var lblWashSpecial: UITextField!
    @IBOutlet weak var lblWashDaily: UITextField!
    @IBOutlet weak var lblWashWeekly: UITextField!
    
    @IBOutlet weak var lblMassageSpecial: UITextField!
    @IBOutlet weak var lblMassageDaily: UITextField!
    @IBOutlet weak var lblMassageWeekly: UITextField!
    
    @IBOutlet weak var lblColorDate: UITextField!
    @IBOutlet weak var lblColorColor: UITextField!
    @IBOutlet weak var lblColorNotes: UITextField!

    @IBOutlet weak var lblCutSkin: UITextField!
    @IBOutlet weak var lblCutTrip: UITextField!
    @IBOutlet weak var lblCutBigChop: UITextField!
    
    @IBOutlet weak var lblStyleNatural: UITextField!
    @IBOutlet weak var lblStyleProtective: UITextField!
    @IBOutlet weak var lblStyleWigs: UITextField!
    
    @IBOutlet weak var lblProductsFigC: UITextField!
    @IBOutlet weak var lblProductsOthers: UITextField!
    
    @IBOutlet weak var lblManicureFix: UITextField!
    @IBOutlet weak var lblManicureMaintain: UITextField!
    @IBOutlet weak var lblManicureTakeOf: UITextField!
    
    @IBOutlet weak var lblPedicureFix: UITextField!
    @IBOutlet weak var lblPedicureMaintain: UITextField!
    @IBOutlet weak var lblPedicureTakeOf: UITextField!
    
    @IBOutlet weak var lblExtensionFix: UITextField!
    @IBOutlet weak var lblExtensionMaintain: UITextField!
    @IBOutlet weak var lblExtensionTakeOf: UITextField!
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
    @IBAction func btnDetailDataClicked(_ sender: Any) {
        let storyBoard = UIStoryboard(name:"Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "SpirtualVC") as! SpirtualVC
//        vc.text = ItemArray[indexPath.row]
        vc.from = "HairAndNails"
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func btnSaveClicked(_ sender: Any) {
        showUniversalLoadingView(true, loadingText: "Loading...")
        if lblWashDaily.text == "" || lblWashWeekly.text == "" || lblWashSpecial.text == ""
            || lblMassageDaily.text == "" || lblMassageWeekly.text == "" || lblMassageSpecial.text == ""
            || lblColorDate.text == "" || lblColorColor.text == "" || lblColorNotes.text == ""
            || lblCutSkin.text == "" || lblCutTrip.text == "" || lblCutBigChop.text == ""
            || lblStyleNatural.text == "" || lblStyleProtective.text == "" || lblStyleWigs.text == ""
            || lblProductsFigC.text == "" || lblProductsOthers.text == ""
            || lblManicureFix.text == "" || lblManicureMaintain.text == "" || lblManicureTakeOf.text == ""
            || lblPedicureFix.text == "" || lblPedicureMaintain.text == "" || lblPedicureTakeOf.text == ""
            || lblExtensionFix.text == "" || lblExtensionMaintain.text == "" || lblExtensionTakeOf.text == ""{
            showAlert(inViewController: self, title: "Error!", message: "Text Field Is Missing")
        }else{
            var ref: DocumentReference? = nil
            ref = db.collection("HairAndNails").addDocument(data: [
                "Wash": ["\(lblWashDaily.text ?? "")","\(lblWashWeekly.text ?? "")","\(lblWashSpecial.text ?? "")"],
                
                "Massage": ["\(lblMassageDaily.text ?? "")","\(lblMassageWeekly.text ?? "")","\(lblMassageSpecial.text ?? "")"],
                
                "Color": ["\(lblColorDate.text ?? "")","\(lblColorColor.text ?? "")","\(lblColorNotes.text ?? "")"],
                
                "Cut": ["\(lblCutSkin.text ?? "")","\(lblCutTrip.text ?? "")","\(lblCutBigChop.text ?? "")"],
                
                "Style": ["\(lblStyleNatural.text ?? "")","\(lblStyleProtective.text ?? "")","\(lblStyleWigs.text ?? "")"],
                
                "Products": ["\(lblProductsFigC.text ?? "")","\(lblProductsOthers.text ?? "")",""],
                
                "Manicure": ["\(lblManicureFix.text ?? "")","\(lblManicureMaintain.text ?? "")","\(lblManicureTakeOf.text ?? "")"],
                
                "Pedicure": ["\(lblPedicureFix.text ?? "")","\(lblPedicureMaintain.text ?? "")","\(lblPedicureTakeOf.text ?? "")"],
                
                "Extension": ["\(lblExtensionFix.text ?? "")","\(lblExtensionMaintain.text ?? "")","\(lblExtensionTakeOf.text ?? "")"]
                
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
