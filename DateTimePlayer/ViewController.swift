//
//  ViewController.swift
//  DateTimePlayer
//
//  Created by user on 31/10/2017.
//  Copyright © 2017 edison. All rights reserved.
//

import UIKit
extension UIViewController{
    
    func convertStringToDate(inputString: String, stringFormat: String, timeZone : String)->Date?{
        let myFormatter = DateFormatter()
        myFormatter.timeZone = TimeZone(identifier: timeZone)!
        myFormatter.dateFormat = stringFormat

        //return myFormatter.date(from: inputString)
        if let theDay = myFormatter.date(from: inputString){

            let dayString = myFormatter.string(from: theDay)
            print("dayString :\(dayString)")
            
        }else{
            print("Failed to convert string to Date")
        }
        return myFormatter.date(from: inputString)
    }
    
    func convertDateToString(inputDate: Date, stringFormat: String, stringTimeZone : String)->String?{
        let myFormatter = DateFormatter()
        myFormatter.timeZone = TimeZone(identifier: stringTimeZone)!
        myFormatter.dateFormat = stringFormat
        let dayString = myFormatter.string(from: inputDate)
        print("dayString :\(dayString)")
        return dayString
    }
    static func getDateComponentsFromDate(inputDate: Date)-> DateComponents{
        let hkCalendar = Calendar.current
        let dateCompoents = hkCalendar.dateComponents([.year, .month, .day, .hour, .minute, .timeZone, .calendar,.weekday], from: inputDate)
        print("hour: \(dateCompoents.hour!)") //7
        print("mins: \(dateCompoents.minute!)")//20
        print("month: \(dateCompoents.month!)") //9
        print("day: \(dateCompoents.day!)") //27
        print("year: \(dateCompoents.year!)")//2017
        print("timeZone.description: \(dateCompoents.timeZone!.description)") //"Asia/Hong_Kong (current)"
        print("weekday: \(dateCompoents.weekday!)")//4
        print("timeZone: \(dateCompoents.calendar!.timeZone)")//"Asia/Hong_Kong (current)"
        return dateCompoents
    }
   func getAllTimeZoneList(){
        let timeZoneList = TimeZone.knownTimeZoneIdentifiers
        for name in timeZoneList{
            print("name: \(name)")
        }
    }
}
class ViewController: UIViewController {

    @IBOutlet weak var convertBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        convertBtn.layer.cornerRadius = 3
    }

    @IBAction func convertAction(_ sender: UIButton) {
        
        let myFormatter = DateFormatter()
        myFormatter.timeZone = TimeZone(identifier: "Asia/Hong_Kong")!
        myFormatter.dateFormat = "Y-MM-dd HH:mm:ss Z"
    
        if let theDay = myFormatter.date(from: "2017-09-26 16:20:00 -0700"){
            // It is tricky if u print the date(it will use +0000)
            print("theDay: \(theDay)")
            let hkCalendar = Calendar.current
            let dateCompoents = hkCalendar.dateComponents([.year, .month, .day, .hour, .minute, .timeZone, .calendar,.weekday], from: theDay)
            print("hour: \(dateCompoents.hour!)") //7
            print("mins: \(dateCompoents.minute!)")//20
            print("month: \(dateCompoents.month!)") //9
            print("day: \(dateCompoents.day!)") //27
            print("year: \(dateCompoents.year!)")//2017
            print("timeZone.description: \(dateCompoents.timeZone!.description)") //"Asia/Hong_Kong (current)"
            print("weekday: \(dateCompoents.weekday!)")//4
            print("timeZone: \(dateCompoents.calendar!.timeZone)")//"Asia/Hong_Kong (current)"
            let dayString = myFormatter.string(from: theDay)
            // It will be the time in STRING, using your specified TIMEZONE
            print("dayString :\(dayString)")
            
        }else{
            print("Failed to convert string to Date")
        }
        
        //let str = convertDateToString(inputDate: Date(), stringFormat: "Y-MM-dd HH:mm:ss Z", stringTimeZone: "Africa/Abidjan")
        //let date = convertStringToDate(inputString: "2017-10-31 10:30:00 +0800", stringFormat: "Y-MM-dd HH:mm:ss Z", timeZone: "Africa/Abidjan")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

