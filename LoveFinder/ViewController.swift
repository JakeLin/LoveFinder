//
//  ViewController.swift
//  LoveFinder
//
//  Created by Jake Lin on 25/08/2014.
//  Copyright (c) 2014 rushjet. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var gender: UISegmentedControl!
    
    @IBOutlet weak var birthday: UIDatePicker!
    
    @IBOutlet weak var heightNumber: UISlider!
    
    @IBOutlet weak var hasProperty: UISwitch!
    
    @IBOutlet weak var result: UITextView!
    
    @IBOutlet weak var height: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        name.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Event handlers
    @IBAction func heightChanged(sender: AnyObject) {
        // round the step to int
        let slider = sender as! UISlider
        let i = Int(slider.value)
        slider.value = Float(i);
        height.text = "\(i) 厘米"
    }
    
    @IBAction func okTapped(sender: AnyObject) {
        let nameText = name.text?.characters.count > 0 ? name.text! : "无名氏"
        let genderText = gender.selectedSegmentIndex==0 ? "高富帅": "白富美"
        
        let hasPropertyText = hasProperty.on ? "有房": "没房"

        // get the age
        let gregorian = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let now = NSDate()
        let components = gregorian?.components([.Year], fromDate: birthday.date, toDate: now, options: NSCalendarOptions(rawValue: 0))
        let age = components?.year
        
        result.text = "\(nameText), \(age!)岁, \(genderText), 身高\(height.text!), \(hasPropertyText), 求交往！"
    }
    
    // UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

