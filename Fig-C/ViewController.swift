//
//  ViewController.swift
//  Fig-C
//
//  Created by maaz tausif on 20/02/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnPersonalPlanner: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        btnPersonalPlanner.layer.cornerRadius = 25
//        btnPersonalPlanner.layer.borderWidth = 1.0
//        btnPersonalPlanner.layer.borderColor = UIColor(hexString: "#5E338C").cgColor
        
        btnLogin.layer.cornerRadius = 25
        btnLogin.layer.borderWidth = 1.0
        btnLogin.layer.borderColor = UIColor.black.cgColor

    }
    @IBAction func btnLoginPressed(_ sender: Any) {
        let storyBoard = UIStoryboard(name:"Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func btnPersonalPlannerPressed(_ sender: Any) {
    }
    
}

@IBDesignable extension UIView {
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let cgColor = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: cgColor)
        }
        set { layer.borderColor = newValue?.cgColor }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
}
@IBDesignable extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
              layer.cornerRadius = newValue

              // If masksToBounds is true, subviews will be
              // clipped to the rounded corners.
              layer.masksToBounds = (newValue > 0)
        }
    }
}
