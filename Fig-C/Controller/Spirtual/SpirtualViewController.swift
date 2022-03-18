//
//  SpirtualViewController.swift
//  Fig-C
//
//  Created by maaz tausif on 20/02/2022.
//

import UIKit

class SpirtualViewController: UIViewController {

    @IBOutlet weak var txtPending: UITextField!
    @IBOutlet weak var txtRequest: UITextField!
    @IBOutlet weak var BtnSave: UIButton!
    @IBOutlet weak var btnBook: UIButton!
    @IBOutlet weak var btnNight: UIButton!
    @IBOutlet weak var btnDay: UIButton!
    @IBOutlet weak var txtAnswered: UITextField!
    @IBOutlet weak var btnPraiseMorning: UIButton!
    @IBOutlet weak var btnPraiseNoon: UIButton!
    @IBOutlet weak var btnPraiseNight: UIButton!
    
    @IBOutlet weak var btnPrayerMorning: UIButton!
    @IBOutlet weak var btnPrayerNoon: UIButton!
    @IBOutlet weak var btnPrayerNight: UIButton!
    
    @IBOutlet weak var btnFastingDaily: UIButton!
    @IBOutlet weak var btnFastingWeekly: UIButton!
    @IBOutlet weak var btnFastingMonthly: UIButton!
    var isBtnBook = false
    var isBtnDay = false
    var isBtnNight = false
    
    var isPraiseMorning = false
    var isPraiseNoon = false
    var isPraiseNight = false
    
    var isPrayerMorning = false
    var isPrayerNoon = false
    var isPrayerNight = false
    
    var isFastingDaily = false
    var isFastingeekly = false
    var isFastingMonthly = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Btn day
        btnDay.layer.cornerRadius = 10
        btnDay.layer.borderColor = UIColor(hexString: "#5E338C").cgColor
        btnDay.layer.borderWidth = 1
        //btn night
        btnNight.layer.cornerRadius = 10
        btnNight.layer.borderColor = UIColor(hexString: "#5E338C").cgColor
        btnNight.layer.borderWidth = 1
        //btn book
        btnBook.layer.cornerRadius = 10
        btnBook.layer.borderColor = UIColor(hexString: "#5E338C").cgColor
        btnBook.layer.borderWidth = 1
        //btn praise
        btnPraiseMorning.layer.cornerRadius = 10
        btnPraiseMorning.layer.borderColor = UIColor(hexString: "#5E338C").cgColor
        btnPraiseMorning.layer.borderWidth = 1
        //btn praise Noon
        btnPraiseNoon.layer.cornerRadius = 10
        btnPraiseNoon.layer.borderColor = UIColor(hexString: "#5E338C").cgColor
        btnPraiseNoon.layer.borderWidth = 1
        //btn praise Night
        btnPraiseNight.layer.cornerRadius = 10
        btnPraiseNight.layer.borderColor = UIColor(hexString: "#5E338C").cgColor
        btnPraiseNight.layer.borderWidth = 1
        //btn prayer morning
        btnPrayerMorning.layer.cornerRadius = 10
        btnPrayerMorning.layer.borderColor = UIColor(hexString: "#5E338C").cgColor
        btnPrayerMorning.layer.borderWidth = 1
        //btn prayer noon
        btnPrayerNoon.layer.cornerRadius = 10
        btnPrayerNoon.layer.borderColor = UIColor(hexString: "#5E338C").cgColor
        btnPrayerNoon.layer.borderWidth = 1
        //btn prayer night
        btnPrayerNight.layer.cornerRadius = 10
        btnPrayerNight.layer.borderColor = UIColor(hexString: "#5E338C").cgColor
        btnPrayerNight.layer.borderWidth = 1
        //btn prayer fasting daily
        btnFastingDaily.layer.cornerRadius = 10
        btnFastingDaily.layer.borderColor = UIColor(hexString: "#5E338C").cgColor
        btnFastingDaily.layer.borderWidth = 1
        //btn prayer fasting weekly
        btnFastingWeekly.layer.cornerRadius = 10
        btnFastingWeekly.layer.borderColor = UIColor(hexString: "#5E338C").cgColor
        btnFastingWeekly.layer.borderWidth = 1
        //btn prayer fasting monthly
        btnFastingMonthly.layer.cornerRadius = 10
        btnFastingMonthly.layer.borderColor = UIColor(hexString: "#5E338C").cgColor
        btnFastingMonthly.layer.borderWidth = 1
        //txt answered
        txtAnswered.layer.borderWidth = 1
        txtAnswered.layer.cornerRadius = 10
        txtAnswered.layer.borderColor = UIColor(hexString: "#5E338C").cgColor
        //txt pending
        txtPending.layer.borderWidth = 1
        txtPending.layer.cornerRadius = 10
        txtPending.layer.borderColor = UIColor(hexString: "#5E338C").cgColor
        //txt request
        txtRequest.layer.borderWidth = 1
        txtRequest.layer.cornerRadius = 10
        txtRequest.layer.borderColor = UIColor(hexString: "#5E338C").cgColor
        //btn saved
        BtnSave.layer.cornerRadius = 15
        BtnSave.layer.borderWidth = 1.0
        BtnSave.layer.borderColor = UIColor.black.cgColor
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnDayPressed(_ sender: Any) {
        if isBtnDay != true{
            btnDay.setImage(UIImage(named: "tick.png"), for: .normal)
            isBtnDay = true
        }else{
            btnDay.setImage(UIImage(named: "cross.png"), for: .normal)
            isBtnDay = false
        }
    }
    
    @IBAction func btnNightPressed(_ sender: Any) {
        if isBtnNight != true{
            btnNight.setImage(UIImage(named: "tick.png"), for: .normal)
            isBtnNight = true
        }else{
            btnNight.setImage(UIImage(named: "cross.png"), for: .normal)
            isBtnNight = false
        }
    }
    @IBAction func btnBookPressed(_ sender: Any) {
        if isBtnBook != true{
            btnBook.setImage(UIImage(named: "tick.png"), for: .normal)
            isBtnBook = true
        }else{
            btnBook.setImage(UIImage(named: "cross.png"), for: .normal)
            isBtnBook = false
        }
    }
    @IBAction func btnSavePressed(_ sender: Any) {
    }
    @IBAction func btnPraiseMorningPressed(_ sender: Any) {
        if isPraiseMorning != true{
            btnPraiseMorning.setImage(UIImage(named: "tick.png"), for: .normal)
            isPraiseMorning = true
        }else{
            btnPraiseMorning.setImage(UIImage(named: "cross.png"), for: .normal)
            isPraiseMorning = false
        }
    }
    
    @IBAction func btnPraiseNoonPressed(_ sender: Any) {
        if isPraiseNoon != true{
            btnPraiseNoon.setImage(UIImage(named: "tick.png"), for: .normal)
            isPraiseNoon = true
        }else{
            btnPraiseNoon.setImage(UIImage(named: "cross.png"), for: .normal)
            isPraiseNoon = false
        }
    }
    @IBAction func btnPraiseNightPressed(_ sender: Any) {
        if isPraiseNight != true{
            btnPraiseNight.setImage(UIImage(named: "tick.png"), for: .normal)
            isPraiseNight = true
        }else{
            btnPraiseNight.setImage(UIImage(named: "cross.png"), for: .normal)
            isPraiseNight = false
        }
    }
    @IBAction func btnPrayerMorningPressed(_ sender: Any) {
        if isPrayerMorning != true{
            btnPrayerMorning.setImage(UIImage(named: "tick.png"), for: .normal)
            isPrayerMorning = true
        }else{
            btnPrayerMorning.setImage(UIImage(named: "cross.png"), for: .normal)
            isPrayerMorning = false
        }
    }
    @IBAction func btnPrayerNoonPressed(_ sender: Any) {
        if isPrayerNoon != true{
            btnPrayerNoon.setImage(UIImage(named: "tick.png"), for: .normal)
            isPrayerNoon = true
        }else{
            btnPrayerNoon.setImage(UIImage(named: "cross.png"), for: .normal)
            isPrayerNoon = false
        }
    }
    @IBAction func BtnPrayerNightPressed(_ sender: Any) {
        if isPrayerNight != true{
            btnPrayerNight.setImage(UIImage(named: "tick.png"), for: .normal)
            isPrayerNight = true
        }else{
            btnPrayerNight.setImage(UIImage(named: "cross.png"), for: .normal)
            isPrayerNight = false
        }
    }
    @IBAction func btnFastingDaily(_ sender: Any) {
        if isFastingDaily != true{
            btnFastingDaily.setImage(UIImage(named: "tick.png"), for: .normal)
            isFastingDaily = true
        }else{
            btnFastingDaily.setImage(UIImage(named: "cross.png"), for: .normal)
            isFastingDaily = false
        }
    }
    @IBAction func btnFastingWeekly(_ sender: Any) {
        if isFastingeekly != true{
            btnFastingWeekly.setImage(UIImage(named: "tick.png"), for: .normal)
            isFastingeekly = true
        }else{
            btnFastingWeekly.setImage(UIImage(named: "cross.png"), for: .normal)
            isFastingeekly = false
        }
    }
    @IBAction func btnFastingMonthly(_ sender: Any) {
        if isFastingMonthly != true{
            btnFastingMonthly.setImage(UIImage(named: "tick.png"), for: .normal)
            isFastingMonthly = true
        }else{
            btnFastingMonthly.setImage(UIImage(named: "cross.png"), for: .normal)
            isFastingMonthly = false
        }
    }
}
extension SpirtualViewController{
    
}
