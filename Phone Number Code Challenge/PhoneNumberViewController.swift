//
//  PhoneNumberViewController.swift
//  Phone Number Code Challenge
//
//  Created by Toleen Jaradat on 1/30/17.
//  Copyright © 2017 Toleen Jaradat. All rights reserved.
//

import UIKit

class PhoneNumberViewController: UIViewController {
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var areaCodeLbl: UILabel!
    
    @IBOutlet weak var phoneNumberLbl: UILabel!
    @IBOutlet weak var formattedPhoneNumberLbl: UILabel!
    
    @IBAction func goButtonPressed(_ sender: Any) {
        
        //check if empty
        if (phoneNumberTextField.text?.isEmpty)! {
            
            let alert = UIAlertController(title: " ", message: "Please enter phone number", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        //remove non-numeric characters
        var phoneNumber = ((phoneNumberTextField.text)?.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: ""))!
            print (phoneNumber)
        
        //check the number of digits
        if ((phoneNumber.characters.count) < 10 || (phoneNumber.characters.count) > 11) {
            
            phoneNumber = "0000000000" //Bad Number
            phoneNumberLbl.text = phoneNumber
            areaCodeLbl.text = " "
            formattedPhoneNumberLbl.text = " "
            
            let alert = UIAlertController(title: " ", message: "Please enter a valid phone number", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        } else if (phoneNumber.characters.count == 11 && phoneNumber.characters.first == "1") {
            
                //trim the leading one
                phoneNumber.remove(at: phoneNumber.startIndex)
                print(phoneNumber)
                formatMyPhoneNumber(phoneNumber: phoneNumber)
            
        } else if (phoneNumber.characters.count == 10) { // Good number
        
            print(phoneNumber)
            formatMyPhoneNumber(phoneNumber: phoneNumber)
            
            
        } else if (phoneNumber.characters.count == 11 && phoneNumber.characters.first != "1") {
            
            phoneNumber = "0000000000" //Bad Number
            phoneNumberLbl.text = phoneNumber
            areaCodeLbl.text = " "
            formattedPhoneNumberLbl.text = " "

            let alert = UIAlertController(title: " ", message: "Please enter a valid phone number", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    func formatMyPhoneNumber(phoneNumber: String){ // this formats only good numbers
        
        phoneNumberLbl.text = phoneNumber
        
        let myPhoneNumber = PhoneNumber()
        myPhoneNumber.areaCode = getSubstring(phoneNumber: phoneNumber, start: 0, end: -7)!
        areaCodeLbl.text =  myPhoneNumber.areaCode
        print(myPhoneNumber.areaCode)
        let middleThreeDigits = getSubstring(phoneNumber: phoneNumber, start: 3, end: -4)!
        print(middleThreeDigits)
        let lastFourDigits = getSubstring(phoneNumber: phoneNumber, start: 6, end: 0)!
        print(lastFourDigits)
        myPhoneNumber.formattedPhoneNumber = String(format: "(%@) ", myPhoneNumber.areaCode) + middleThreeDigits + "-" + lastFourDigits
        formattedPhoneNumberLbl.text = myPhoneNumber.formattedPhoneNumber
        print(myPhoneNumber.formattedPhoneNumber)
        
    }
    
    func getSubstring(phoneNumber:String, start: Int, end: Int) -> String? {
        
        let substringStartIndex = phoneNumber.index((phoneNumber.startIndex), offsetBy: start)
        let substringEndIndex = phoneNumber.index((phoneNumber.endIndex), offsetBy: end)
        let range = substringStartIndex..<substringEndIndex
        return  phoneNumber.substring(with: range)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
