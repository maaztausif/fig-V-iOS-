//
//  MainViewController.swift
//  Fig-C
//
//  Created by maaz tausif on 20/02/2022.
//

import UIKit

class MainViewController: UIViewController{

    var ItemArray = ["Spiritual","Hair and Nails","Work","Groceries","Personal Shopping","Budgets","Gifts","Utilities","FiG-C","Community Development","Holiday","Exercise","Meals"]

    @IBOutlet weak var tableViewMain: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewMain.delegate = self
        tableViewMain.dataSource = self
        // Do any additional setup after loading the view.

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
//MARK: tableViewController
extension MainViewController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewMain.dequeueReusableCell(withIdentifier: "MainTableViewCell") as! MainTableViewCell
        cell.lblItem.text = ItemArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            let storyBoard = UIStoryboard(name:"Main", bundle:nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "SpirtualMainViewController") as! SpirtualMainViewController
            print(ItemArray[indexPath.row])
//            vc.lblTop.text! = "ItemArray[indexPath.row]"
            vc.text = ItemArray[indexPath.row]
            self.present(vc, animated: true, completion: nil)
        }
        else if indexPath.row == 1{
            let storyBoard = UIStoryboard(name:"Main", bundle:nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "HairAndNailsViewController") as! HairAndNailsViewController
            vc.text = ItemArray[indexPath.row]
            self.present(vc, animated: true, completion: nil)
        }
        else if indexPath.row == 2{
            let storyBoard = UIStoryboard(name:"Main", bundle:nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "WorkViewController") as! WorkViewController
            vc.text = ItemArray[indexPath.row]
            self.present(vc, animated: true, completion: nil)
        }
        else if indexPath.row == 3{
            let storyBoard = UIStoryboard(name:"Main", bundle:nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "GroceriesViewController") as! GroceriesViewController
            vc.text = ItemArray[indexPath.row]
            self.present(vc, animated: true, completion: nil)
        }
        else if indexPath.row == 4{
            let storyBoard = UIStoryboard(name:"Main", bundle:nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "GroceriesViewController") as! GroceriesViewController
            vc.isPersonal = true
            vc.text = ItemArray[indexPath.row]
            self.present(vc, animated: true, completion: nil)
        }
        else if indexPath.row == 5{
            let storyBoard = UIStoryboard(name:"Main", bundle:nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "BudgetViewController") as! BudgetViewController
            vc.text = ItemArray[indexPath.row]
            self.present(vc, animated: true, completion: nil)
        }
        else if indexPath.row == 6{
            let storyBoard = UIStoryboard(name:"Main", bundle:nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "GiftViewController") as! GiftViewController
            vc.text = ItemArray[indexPath.row]
            self.present(vc, animated: true, completion: nil)
        }
        else if indexPath.row == 7{
            let storyBoard = UIStoryboard(name:"Main", bundle:nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "UtilitiesViewController") as! UtilitiesViewController
            vc.text = ItemArray[indexPath.row]
            self.present(vc, animated: true, completion: nil)
        }
        else if indexPath.row == 8{
            let storyBoard = UIStoryboard(name:"Main", bundle:nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "Fig_C_ViewController") as! Fig_C_ViewController
            vc.text = ItemArray[indexPath.row]
            self.present(vc, animated: true, completion: nil)
        }
        else if indexPath.row == 9{
            let storyBoard = UIStoryboard(name:"Main", bundle:nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "CommunityDevelopmentViewController") as! CommunityDevelopmentViewController
            vc.text = ItemArray[indexPath.row]
            self.present(vc, animated: true, completion: nil)
        }
        else if indexPath.row == 10{
            let storyBoard = UIStoryboard(name:"Main", bundle:nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "HolidayViewController") as! HolidayViewController
            vc.text = ItemArray[indexPath.row]
            self.present(vc, animated: true, completion: nil)
        }
        else if indexPath.row == 11{
            let storyBoard = UIStoryboard(name:"Main", bundle:nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "ExcerciseViewController") as! ExcerciseViewController
            vc.text = ItemArray[indexPath.row]
            self.present(vc, animated: true, completion: nil)
        }
        else if indexPath.row == 12{
            let storyBoard = UIStoryboard(name:"Main", bundle:nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "MealViewController") as! MealViewController
            vc.text = ItemArray[indexPath.row]
            self.present(vc, animated: true, completion: nil)
        }
        else if indexPath.row == 13{
            let storyBoard = UIStoryboard(name:"Main", bundle:nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "ExcerciseViewController") as! ExcerciseViewController
            vc.text = ItemArray[indexPath.row]
            self.present(vc, animated: true, completion: nil)
        }
        else if indexPath.row == 14{
            let storyBoard = UIStoryboard(name:"Main", bundle:nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "MealViewController") as! MealViewController
            vc.text = ItemArray[indexPath.row]
            self.present(vc, animated: true, completion: nil)
        }
    }
}
