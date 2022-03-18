//
//  Fig-C-ViewController.swift
//  Fig-C
//
//  Created by maaz tausif on 23/02/2022.
//

import UIKit
import Firebase
class Fig_C_ViewController: UIViewController {
    var text = ""
    let db = Firestore.firestore()

    @IBOutlet weak var lblTop: UILabel!
    
    @IBOutlet weak var lblEmboidryDaily: UITextField!
    @IBOutlet weak var lblNaturalHairProductSpecial: UITextField!
    @IBOutlet weak var lblBooksNotes: UITextField!
    @IBOutlet weak var lblNaturalScentedSoapBigChop: UITextField!
    @IBOutlet weak var lblNutritionMealsWigs: UITextField!
    @IBOutlet weak var lblTrainingOthers: UITextField!

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
        vc.from = "Fig-C"
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func btnSaveClicked(_ sender: Any) {
        showUniversalLoadingView(true, loadingText: "Loading...")
        if lblEmboidryDaily.text == "" || lblNaturalHairProductSpecial.text == "" || lblBooksNotes.text == ""
            && lblNaturalScentedSoapBigChop.text == "" || lblNutritionMealsWigs.text == "" || lblTrainingOthers.text == ""{
            showUniversalLoadingView(false, loadingText: "")
            showAlert(inViewController: self, title: "Error!", message: "Text Field Is Missing")
        }else{
            var ref: DocumentReference? = nil
            ref = db.collection("Fig-C").addDocument(data: [
                "Emboidry": "\(lblEmboidryDaily.text ?? "")",
                "NaturalHairProductSpecial": "\(lblNaturalHairProductSpecial.text ?? "")",
                "BooksNotes": "\(lblBooksNotes.text ?? "")",
                "NaturalScentedSoapBigChop": "\(lblNaturalScentedSoapBigChop.text ?? "")",
                "NutritionMealsWigs": "\(lblNutritionMealsWigs.text ?? "")",
                "TrainingOthers": "\(lblTrainingOthers.text ?? "")",
                
                
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
