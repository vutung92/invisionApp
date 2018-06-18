//
//  IATapIDVC.swift
//  InvisionApp
//
//  Created by Tung Vu on 6/17/18.
//  Copyright © 2018 Tung Vu. All rights reserved.
//

import UIKit

class IATapIDVC: UIViewController {

    
    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblStudentNumber: UILabel!
    @IBOutlet weak var lblLibraryNumber: UILabel!
    @IBOutlet weak var lblStartDate: UILabel!
    @IBOutlet weak var lblExpriryDate: UILabel!
    @IBOutlet weak var lblCourse: UILabel!
    @IBOutlet weak var lblDepartment: UILabel!
    
    @IBOutlet weak var viewTapID: UIView!{
        didSet {
            viewTapID.layer.cornerRadius = 5
        }
    }
    
    var userdata: IAUserData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNeedsStatusBarAppearanceUpdate()
        
        lblFirstName.text = userdata?.first_name
        lblLastName.text = userdata?.last_name
        lblStudentNumber.text = userdata?.student_number
        lblLibraryNumber.text = userdata?.library_number
        lblStartDate.text = converStringtoDate(date: (userdata?.start_date)!)
        lblExpriryDate.text = converStringtoDate(date: (userdata?.expiry_date)!)
        lblCourse.text = userdata?.course
        lblDepartment.text = userdata?.department
   
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    
    func converStringtoDate(date:String) -> String{
        let dateString:String = date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.locale = Locale.init(identifier: "en_GB")
        let dateObj = dateFormatter.date(from: dateString)
        let result = convertDateFormate(date: dateObj!)
        return result
    }
    
    func convertDateFormate(date : Date) -> String{
        // Day
        let calendar = Calendar.current
        let anchorComponents = calendar.dateComponents([.day, .month, .year], from: date)
        
        // Formate
        let dateFormate = DateFormatter()
        dateFormate.dateFormat = "MMM yyyy"
        let newDate = dateFormate.string(from: date)
        
        var day  = "\(anchorComponents.day!)"
        switch (day) {
        case "1" , "21" , "31":
            day.append("st")
        case "2" , "22":
            day.append("nd")
        case "3" ,"23":
            day.append("rd")
        default:
            day.append("th")
        }
        return day + " " + newDate
    }
    
}
