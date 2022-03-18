//
//  SpirtualVC.swift
//  Fig-C
//
//  Created by maaz tausif on 14/03/2022.
//

import UIKit
import Firebase

class SpirtualVC: UIViewController {
    let db = Firestore.firestore()
    var from = ""
//    var auth  = Auth.auth().currentUser!.uid
//    var items = [My_Item]()
//    var items_Temp = [My_Item]()
    var i = 0
    var spirtualArray = ["Bible","Fasting","Petition","Praise","Prayer"]
    var hairAndNailsArray = ["Color","Cut","Extension","Manicure","Massage","Pedicure","Products","Style","Wash"]
    var workArray = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
    var groceriesArray = ["January","Febuary","March","April","May","June","July","August","September","Octuber","November","December"]
    var budgetArray = ["Bedroom","Car","Garden","Home","PersonalDevelopment","Property","Studio"]
    var giftArray = ["Birthday","Charity","Christmas","Funeral","Special","Wedding"]
    var utilitiesArray = ["Council Tax","Electricity","Gas","Phone","Tv License","Water"]
    var figcArray = ["BooksNotes","Emboidry","NaturalHairProductSpecial","NaturalScentedSoapBigChop","NutritionMealsWigs","TrainingOthers"]
    var communityDevelopmentArray = ["NCIP","IAHRAC","ETC","IEBOTC","NIEBIYAKTC","AKS","FIGCCharity"]
    var excerciseArray = ["Deep Breath","Other","Stepper","Walk"]
    var mealArray = ["Breakfast","Dinner","Drinks","Intermittent Fasting","Lunch","Snack"]
    var holidayArray = ["Cases","Date","Hand luggage","Location","Miscellaneous","Mode","Sight Seeing","Travel"]

    @IBOutlet weak var tableViewSpirtual: UITableView!
    var arrayDocuments = [[[String]]]()
    var arrayDocumentsFigc = [[String]]()
    //Holiday
    var casses = [[String]]()
    var date = [[String]]()
    var handLugage = [[String]]()
    var location = [[String]]()
    var misc = [[String]]()
    var mode = [[String]]()
    var sight = [[String]]()
    var travel = [[String]]()

    //Meal
    var Breakfast = [String]()
    var Dinner = [String]()
    var Drinks = [String]()
    var IntermittentFasting = [String]()
    var Lunch = [String]()
    var Snack = [String]()
    //excercise
    var deepBreath = [String]()
    var Other = [String]()
    var stepper = [String]()
    var Walk = [String]()

    //communityDevelopment
    var NCIP = [String]()
    var IAHRAC = [String]()
    var ETC = [String]()
    var IEBOTC = [String]()
    var NIEBIYAKTC = [String]()
    var AKS = [String]()
    var FIGCCharity = [String]()
    //Spirtual
    var bible = [[String]]()
    var Fasting = [[String]]()
    var Petition = [[String]]()
    var Praise = [[String]]()
    var Prayer = [[String]]()
    //Hair and Nails
    var Color = [[String]]()
    var Cut = [[String]]()
    var Extension = [[String]]()
    var Manicure = [[String]]()
    var Massage = [[String]]()
    var Pedicure = [[String]]()
    var Product = [[String]]()
    var Style = [[String]]()
    var Wash = [[String]]()
    //Work
    var sunday = [[String]]()
    var monday = [[String]]()
    var tuesday = [[String]]()
    var wednesday = [[String]]()
    var thursday = [[String]]()
    var friday = [[String]]()
    var saturday = [[String]]()
    //Groceries
    var jan = [[String]]()
    var feb = [[String]]()
    var march = [[String]]()
    var april = [[String]]()
    var may = [[String]]()
    var june = [[String]]()
    var july = [[String]]()
    var aug = [[String]]()
    var sep = [[String]]()
    var oct = [[String]]()
    var nov = [[String]]()
    var dec = [[String]]()
    //Budget
    var bedroom = [[String]]()
    var car = [[String]]()
    var garden = [[String]]()
    var home = [[String]]()
    var personalDevelopment = [[String]]()
    var property = [[String]]()
    var studio = [[String]]()
    //Groceries
    var birthday = [[String]]()
    var charity = [[String]]()
    var christmas = [[String]]()
    var funeral = [[String]]()
    var special = [[String]]()
    var wedding = [[String]]()
    //Utilities
    var councilTax = [[String]]()
    var Electricity = [[String]]()
    var gas = [[String]]()
    var phone = [[String]]()
    var tvLicense = [[String]]()
    var water = [[String]]()
    //fig c
    var books = [String]()
    var emboidry = [String]()
    var naturalHair = [String]()
    var naturalScented = [String]()
    var nutrition = [String]()
    var TrainingOthers = [String]()
    var spr = spirtual()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSpirtual.register(UINib(nibName: "SpirtualTVC", bundle: nil), forCellReuseIdentifier: "SpirtualTVC")
        tableViewSpirtual.register(UINib(nibName: "SingleTVC", bundle: nil), forCellReuseIdentifier: "SingleTVC")

        getDocuments()
        tableViewSpirtual.delegate = self
        tableViewSpirtual.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func getDocuments(){
        // this whole code is used to fetch data from firebase
//        items_Temp.removeAll()
        self.db.collection("\(from)").getDocuments { [self] (ducomentSnapshot, error) in
                           if error != nil{
                            
                           }else{
                               if from == "Spirtual"{
                                   for document in ducomentSnapshot!.documents {
                                       var Document1 = [String]()
                                       var Document2 = [String]()
                                       var Document3 = [String]()
                                       var Document4 = [String]()
                                       var Document5 = [String]()

                                       Document1 = document.data()[spirtualArray[0]] as! [String]
                                       Document2 = document.data()[spirtualArray[1]] as! [String]
                                       Document3 = document.data()[spirtualArray[2]] as! [String]
                                       Document4 = document.data()[spirtualArray[3]] as! [String]
                                       Document5 = document.data()[spirtualArray[4]] as! [String]

                                       self.bible.append(Document1)
                                       self.Praise.append(Document2)
                                       self.Prayer.append(Document3)
                                       self.Fasting.append(Document4)
                                       self.Petition.append(Document5)
                        }
                                   
                                   arrayDocuments.append(bible)
                                   arrayDocuments.append(Praise)
                                   arrayDocuments.append(Prayer)
                                   arrayDocuments.append(Fasting)
                                   arrayDocuments.append(Petition)
                                   tableViewSpirtual.reloadData()
                               }else if from == "HairAndNails"{
                                   for document in ducomentSnapshot!.documents {
                                       var Document1 = [String]()
                                       var Document2 = [String]()
                                       var Document3 = [String]()
                                       var Document4 = [String]()
                                       var Document5 = [String]()
                                       var Document6 = [String]()
                                       var Document7 = [String]()
                                       var Document8 = [String]()
                                       var Document9 = [String]()
                                       Document1 = document.data()[hairAndNailsArray[0]] as! [String]
                                       Document2 = document.data()[hairAndNailsArray[1]] as! [String]
                                       Document3 = document.data()[hairAndNailsArray[2]] as! [String]
                                       Document4 = document.data()[hairAndNailsArray[3]] as! [String]
                                       Document5 = document.data()[hairAndNailsArray[4]] as! [String]
                                       Document6 = document.data()[hairAndNailsArray[5]] as! [String]
                                       Document7 = document.data()[hairAndNailsArray[6]] as! [String]
                                       Document8 = document.data()[hairAndNailsArray[7]] as! [String]
                                       Document9 = document.data()[hairAndNailsArray[8]] as! [String]

                                       self.Color.append(Document1)
                                       self.Cut.append(Document2)
                                       self.Extension.append(Document3)
                                       self.Manicure.append(Document4)
                                       self.Massage.append(Document5)
                                       self.Pedicure.append(Document6)
                                       self.Product.append(Document7)
                                       self.Style.append(Document8)
                                       self.Wash.append(Document9)
                        }
                                   
                                   arrayDocuments.append(Color)
                                   arrayDocuments.append(Cut)
                                   arrayDocuments.append(Extension)
                                   arrayDocuments.append(Manicure)
                                   arrayDocuments.append(Massage)
                                   arrayDocuments.append(Pedicure)
                                   arrayDocuments.append(Product)
                                   arrayDocuments.append(Style)
                                   arrayDocuments.append(Wash)
                                   tableViewSpirtual.reloadData()
                               }
                               else if from == "Work"{
                                   for document in ducomentSnapshot!.documents {
                                       var Document1 = [String]()
                                       var Document2 = [String]()
                                       var Document3 = [String]()
                                       var Document4 = [String]()
                                       var Document5 = [String]()
                                       var Document6 = [String]()
                                       var Document7 = [String]()

                                       Document1 = document.data()[workArray[0]] as! [String]
                                       Document2 = document.data()[workArray[1]] as! [String]
                                       Document3 = document.data()[workArray[2]] as! [String]
                                       Document4 = document.data()[workArray[3]] as! [String]
                                       Document5 = document.data()[workArray[4]] as! [String]
                                       Document6 = document.data()[workArray[5]] as! [String]
                                       Document7 = document.data()[workArray[6]] as! [String]


                                       self.sunday.append(Document1)
                                       self.monday.append(Document2)
                                       self.tuesday.append(Document3)
                                       self.wednesday.append(Document4)
                                       self.thursday.append(Document5)
                                       self.friday.append(Document6)
                                       self.saturday.append(Document7)

                        }
                                   
                                   arrayDocuments.append(sunday)
                                   arrayDocuments.append(monday)
                                   arrayDocuments.append(tuesday)
                                   arrayDocuments.append(wednesday)
                                   arrayDocuments.append(thursday)
                                   arrayDocuments.append(friday)
                                   arrayDocuments.append(saturday)

                                   tableViewSpirtual.reloadData()
                               }
                        
                               else if from == "Groceries" || from == "Personal"{
                                   for document in ducomentSnapshot!.documents {
                                       var Document1 = [String]()
                                       var Document2 = [String]()
                                       var Document3 = [String]()
                                       var Document4 = [String]()
                                       var Document5 = [String]()
                                       var Document6 = [String]()
                                       var Document7 = [String]()
                                       var Document8 = [String]()
                                       var Document9 = [String]()
                                       var Document10 = [String]()
                                       var Document11 = [String]()
                                       var Document12 = [String]()
                                       Document1 = document.data()[groceriesArray[0]] as! [String]
                                       Document2 = document.data()[groceriesArray[1]] as! [String]
                                       Document3 = document.data()[groceriesArray[2]] as! [String]
                                       Document4 = document.data()[groceriesArray[3]] as! [String]
                                       Document5 = document.data()[groceriesArray[4]] as! [String]
                                       Document6 = document.data()[groceriesArray[5]] as! [String]
                                       Document7 = document.data()[groceriesArray[6]] as! [String]
                                       Document8 = document.data()[groceriesArray[7]] as! [String]
                                       Document9 = document.data()[groceriesArray[8]] as! [String]
                                       Document10 = document.data()[groceriesArray[9]] as! [String]
                                       Document11 = document.data()[groceriesArray[10]] as! [String]
                                       Document12 = document.data()[groceriesArray[11]] as! [String]

                                       self.jan.append(Document1)
                                       self.feb.append(Document2)
                                       self.march.append(Document3)
                                       self.april.append(Document4)
                                       self.may.append(Document5)
                                       self.june.append(Document6)
                                       self.july.append(Document7)
                                       self.aug.append(Document8)
                                       self.sep.append(Document9)
                                       self.oct.append(Document10)
                                       self.nov.append(Document11)
                                       self.dec.append(Document12)
                        }
                                   
                                   arrayDocuments.append(jan)
                                   arrayDocuments.append(feb)
                                   arrayDocuments.append(march)
                                   arrayDocuments.append(april)
                                   arrayDocuments.append(may)
                                   arrayDocuments.append(june)
                                   arrayDocuments.append(july)
                                   arrayDocuments.append(aug)
                                   arrayDocuments.append(sep)
                                   arrayDocuments.append(oct)
                                   arrayDocuments.append(nov)
                                   arrayDocuments.append(dec)
                                   tableViewSpirtual.reloadData()
                               }
                               
                               else if from == "Budget"{
                                   for document in ducomentSnapshot!.documents {
                                       var Document1 = [String]()
                                       var Document2 = [String]()
                                       var Document3 = [String]()
                                       var Document4 = [String]()
                                       var Document5 = [String]()
                                       var Document6 = [String]()
                                       var Document7 = [String]()

                                       Document1 = document.data()[budgetArray[0]] as! [String]
                                       Document2 = document.data()[budgetArray[1]] as! [String]
                                       Document3 = document.data()[budgetArray[2]] as! [String]
                                       Document4 = document.data()[budgetArray[3]] as! [String]
                                       Document5 = document.data()[budgetArray[4]] as! [String]
                                       Document6 = document.data()[budgetArray[5]] as! [String]
                                       Document7 = document.data()[budgetArray[6]] as! [String]


                                       self.bedroom.append(Document1)
                                       self.car.append(Document2)
                                       self.garden.append(Document3)
                                       self.home.append(Document4)
                                       self.personalDevelopment.append(Document5)
                                       self.property.append(Document6)
                                       self.studio.append(Document7)

                        }
                                   
                                   arrayDocuments.append(bedroom)
                                   arrayDocuments.append(car)
                                   arrayDocuments.append(garden)
                                   arrayDocuments.append(home)
                                   arrayDocuments.append(personalDevelopment)
                                   arrayDocuments.append(property)
                                   arrayDocuments.append(studio)

                                   tableViewSpirtual.reloadData()
                               }
                               
                               else if from == "Gift"{
                                   for document in ducomentSnapshot!.documents {
                                       var Document1 = [String]()
                                       var Document2 = [String]()
                                       var Document3 = [String]()
                                       var Document4 = [String]()
                                       var Document5 = [String]()
                                       var Document6 = [String]()

                                       Document1 = document.data()[giftArray[0]] as! [String]
                                       Document2 = document.data()[giftArray[1]] as! [String]
                                       Document3 = document.data()[giftArray[2]] as! [String]
                                       Document4 = document.data()[giftArray[3]] as! [String]
                                       Document5 = document.data()[giftArray[4]] as! [String]
                                       Document6 = document.data()[giftArray[5]] as! [String]
      

                                       self.birthday.append(Document1)
                                       self.charity.append(Document2)
                                       self.christmas.append(Document3)
                                       self.funeral.append(Document4)
                                       self.special.append(Document5)
                                       self.wedding.append(Document6)

                        }
                                   
                                   arrayDocuments.append(birthday)
                                   arrayDocuments.append(charity)
                                   arrayDocuments.append(christmas)
                                   arrayDocuments.append(funeral)
                                   arrayDocuments.append(special)
                                   arrayDocuments.append(wedding)
       
                                   tableViewSpirtual.reloadData()
                               }
                               else if from == "Utilities"{
                                   for document in ducomentSnapshot!.documents {
                                       var Document1 = [String]()
                                       var Document2 = [String]()
                                       var Document3 = [String]()
                                       var Document4 = [String]()
                                       var Document5 = [String]()
                                       var Document6 = [String]()

                                       Document1 = document.data()[utilitiesArray[0]] as! [String]
                                       Document2 = document.data()[utilitiesArray[1]] as! [String]
                                       Document3 = document.data()[utilitiesArray[2]] as! [String]
                                       Document4 = document.data()[utilitiesArray[3]] as! [String]
                                       Document5 = document.data()[utilitiesArray[4]] as! [String]
                                       Document6 = document.data()[utilitiesArray[5]] as! [String]
      

                                       self.councilTax.append(Document1)
                                       self.Electricity.append(Document2)
                                       self.gas.append(Document3)
                                       self.phone.append(Document4)
                                       self.tvLicense.append(Document5)
                                       self.water.append(Document6)

                        }
                                   
                                   arrayDocuments.append(councilTax)
                                   arrayDocuments.append(Electricity)
                                   arrayDocuments.append(gas)
                                   arrayDocuments.append(phone)
                                   arrayDocuments.append(tvLicense)
                                   arrayDocuments.append(water)
       
                                   tableViewSpirtual.reloadData()
                               }
                               else if from == "Fig-C"{
                                   for document in ducomentSnapshot!.documents {
                                       var Document1 = String()
                                       var Document2 = String()
                                       var Document3 = String()
                                       var Document4 = String()
                                       var Document5 = String()
                                       var Document6 = String()
                                       print(figcArray[0])
                                       Document1 = document.data()[figcArray[0]] as! String
                                       Document2 = document.data()[figcArray[1]] as! String
                                       Document3 = document.data()[figcArray[2]] as! String
                                       Document4 = document.data()[figcArray[3]] as! String
                                       Document5 = document.data()[figcArray[4]] as! String
                                       Document6 = document.data()[figcArray[5]] as! String
                                       print(Document1)


                                       self.books.append(Document1)
                                       self.emboidry.append(Document2)
                                       self.naturalHair.append(Document3)
                                       self.naturalScented.append(Document4)
                                       self.nutrition.append(Document5)
                                       self.TrainingOthers.append(Document6)

                        }
                                   
//                                   arrayDocuments.append(books)
                                   arrayDocumentsFigc.append(emboidry)
                                   arrayDocumentsFigc.append(naturalHair)
                                   arrayDocumentsFigc.append(naturalScented)
                                   arrayDocumentsFigc.append(nutrition)
                                   arrayDocumentsFigc.append(TrainingOthers)
       
                                   tableViewSpirtual.reloadData()
                               }
                               else if from == "CommunityDevelopment"{
                                   for document in ducomentSnapshot!.documents {
                                       var Document1 = String()
                                       var Document2 = String()
                                       var Document3 = String()
                                       var Document4 = String()
                                       var Document5 = String()
                                       var Document6 = String()
                                       var Document7 = String()
                                       Document1 = document.data()[communityDevelopmentArray[0]] as! String
                                       Document2 = document.data()[communityDevelopmentArray[1]] as! String
                                       Document3 = document.data()[communityDevelopmentArray[2]] as! String
                                       Document4 = document.data()[communityDevelopmentArray[3]] as! String
                                       Document5 = document.data()[communityDevelopmentArray[4]] as! String
                                       Document6 = document.data()[communityDevelopmentArray[5]] as! String
                                       Document7 = document.data()[communityDevelopmentArray[6]] as! String

                                       ["NCIP","IAHRAC","ETC","IEBOTC","NIEBIYAKTC","AKS","FIGCCharity"]
                                       self.NCIP.append(Document1)
                                       self.IAHRAC.append(Document2)
                                       self.ETC.append(Document3)
                                       self.IEBOTC.append(Document4)
                                       self.NIEBIYAKTC.append(Document5)
                                       self.AKS.append(Document6)
                                       self.FIGCCharity.append(Document7)

                        }
                                   
//                                   arrayDocuments.append(books)
                                   arrayDocumentsFigc.append(NCIP)
                                   arrayDocumentsFigc.append(IAHRAC)
                                   arrayDocumentsFigc.append(ETC)
                                   arrayDocumentsFigc.append(IEBOTC)
                                   arrayDocumentsFigc.append(NIEBIYAKTC)
                                   arrayDocumentsFigc.append(AKS)
                                   arrayDocumentsFigc.append(FIGCCharity)
                                   tableViewSpirtual.reloadData()
                               }
                               else if from == "Excercise"{
                                   for document in ducomentSnapshot!.documents {
                                       var Document1 = String()
                                       var Document2 = String()
                                       var Document3 = String()
                                       var Document4 = String()

                                       Document1 = document.data()[excerciseArray[0]] as! String
                                       Document2 = document.data()[excerciseArray[1]] as! String
                                       Document3 = document.data()[excerciseArray[2]] as! String
                                       Document4 = document.data()[excerciseArray[3]] as! String


                                       self.deepBreath.append(Document1)
                                       self.Other.append(Document2)
                                       self.stepper.append(Document3)
                                       self.Walk.append(Document4)
              

                        }
                                   
//                                   arrayDocuments.append(books)
                                   arrayDocumentsFigc.append(deepBreath)
                                   arrayDocumentsFigc.append(Other)
                                   arrayDocumentsFigc.append(stepper)
                                   arrayDocumentsFigc.append(Walk)
                                   tableViewSpirtual.reloadData()

                               }
                               else if from == "Meal"{
                                   for document in ducomentSnapshot!.documents {
                                       var Document1 = String()
                                       var Document2 = String()
                                       var Document3 = String()
                                       var Document4 = String()
                                       var Document5 = String()
                                       var Document6 = String()
                                       Document1 = document.data()[mealArray[0]] as! String
                                       Document2 = document.data()[mealArray[1]] as! String
                                       Document3 = document.data()[mealArray[2]] as! String
                                       Document4 = document.data()[mealArray[3]] as! String
                                       Document5 = document.data()[mealArray[4]] as! String
                                       Document6 = document.data()[mealArray[5]] as! String

                                       ["Breakfast","Dinner","Drinks","Intermittent Fasting","Lunch","Snack"]
                                       self.Breakfast.append(Document1)
                                       self.Dinner.append(Document2)
                                       self.Drinks.append(Document3)
                                       self.IntermittentFasting.append(Document4)
                                       self.Lunch.append(Document5)
                                       self.Snack.append(Document6)

                        }
                                   
//                                   arrayDocuments.append(books)
                                   arrayDocumentsFigc.append(Breakfast)
                                   arrayDocumentsFigc.append(Dinner)
                                   arrayDocumentsFigc.append(Drinks)
                                   arrayDocumentsFigc.append(IntermittentFasting)
                                   arrayDocumentsFigc.append(Lunch)
                                   arrayDocumentsFigc.append(Snack)
                                   tableViewSpirtual.reloadData()
                               }
                               
                               else if from == "Holiday"{
                                   for document in ducomentSnapshot!.documents {
                                       var Document1 = [String]()
                                       var Document2 = [String]()
                                       var Document3 = [String]()
                                       var Document4 = [String]()
                                       var Document5 = [String]()
                                       var Document6 = [String]()
                                       var Document7 = [String]()
                                       var Document8 = [String]()
                                       
                                       Document1 = document.data()[holidayArray[0]] as! [String]
                                       Document2 = document.data()[holidayArray[1]] as! [String]
                                       Document3 = document.data()[holidayArray[2]] as! [String]
                                       Document4 = document.data()[holidayArray[3]] as! [String]
                                       Document5 = document.data()[holidayArray[4]] as! [String]
                                       Document6 = document.data()[holidayArray[5]] as! [String]
                                       Document7 = document.data()[holidayArray[6]] as! [String]
                                       Document8 = document.data()[holidayArray[7]] as! [String]
                                       print(Document1)
                                       self.casses.append(Document1)
                                       self.date.append(Document2)
                                       self.handLugage.append(Document3)
                                       self.location.append(Document4)
                                       self.misc.append(Document5)
                                       self.mode.append(Document6)
                                       self.sight.append(Document7)
                                       self.travel.append(Document8)

                        }
                                   
                                   arrayDocuments.append(casses)
                                   arrayDocuments.append(date)
                                   arrayDocuments.append(handLugage)
                                   arrayDocuments.append(location)
                                   arrayDocuments.append(misc)
                                   arrayDocuments.append(mode)
                                   arrayDocuments.append(sight)
                                   arrayDocuments.append(travel)
                                   tableViewSpirtual.reloadData()
                               }
                        }
                }

//                    self.tableView.reloadData()
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


extension SpirtualVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if from == "Fig-C" || from == "CommunityDevelopment" || from == "Excercise" || from == "Meal" {
            return arrayDocumentsFigc[section].count

        }else{
            return arrayDocuments[section].count

        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if from == "Fig-C" || from == "CommunityDevelopment" || from == "Excercise" || from == "Meal"{
            return arrayDocumentsFigc.count

        }else{
            return arrayDocuments.count

        }

    }
    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return arrayDocuments[section].count
//    }
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return arrayDocuments[section].count
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if from == "Spirtual" || from ==  "HairAndNails" || from ==  "Work" || from == "Groceries" || from == "Personal" || from == "Budget" || from == "Gift" || from == "Utilities" || from == "Holiday"{
            let cell = tableViewSpirtual.dequeueReusableCell(withIdentifier: "SpirtualTVC") as! SpirtualTVC

            if arrayDocuments[indexPath.section][indexPath.row][0] == ""{
                cell.lbl1.isHidden = true
            }else{
                cell.lbl1.text = arrayDocuments[indexPath.section][indexPath.row][0]
            }
            if arrayDocuments[indexPath.section][indexPath.row][1] == ""{
                cell.lbl2.isHidden = true
            }else{
                cell.lbl2.text = arrayDocuments[indexPath.section][indexPath.row][1]
            }
            if arrayDocuments[indexPath.section][indexPath.row][2] == ""{
                cell.lbl3.isHidden = true
            }else{
                cell.lbl3.text = arrayDocuments[indexPath.section][indexPath.row][2]
            }
            cell.backgroundColor = UIColor(hexString: "#B18904")
            return cell
        }
        else if from == "Fig-C" || from == "CommunityDevelopment" || from == "Excercise" || from == "Meal"{
            
            let cell = tableViewSpirtual.dequeueReusableCell(withIdentifier: "SingleTVC") as! SingleTVC
            cell.lbl1.text = arrayDocumentsFigc[indexPath.section][0]
            cell.backgroundColor = UIColor(hexString: "#B18904")
            return cell
        }


       
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if from == "Spirtual"{
            return spirtualArray[section]
        }else if from == "HairAndNails"{
            return hairAndNailsArray[section]
        }else if from == "Work"{
            return workArray[section]
        }else if from == "Groceries" || from == "Personal"{
            return groceriesArray[section]
        }else if from == "Budget"{
            return budgetArray[section]
        }else if from == "Gift"{
            return giftArray[section]
        }else if from == "Utilities"{
            return utilitiesArray[section]
        }else if from == "Fig-C"{
            return figcArray[section]
        }else if from == "CommunityDevelopment"{
            return communityDevelopmentArray[section]
        }else if from == "Excercise"{
            return excerciseArray[section]
        }else if from == "Meal"{
            return mealArray[section]
        }else if  from == "Holiday"{
            return holidayArray[section]
        }
        return figcArray[section]
    }
}
class spirtual{
//    var name:String?
    var fields:[[String]]?
    init(allFeilds:[[String]]){
//        self.name = theName
        self.fields = allFeilds
    }
    init(){
        
    }
}
