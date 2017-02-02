//
//  Phone Number Code ChallengeTests.swift
//  Phone Number Code ChallengeTests
//
//  Created by Toleen Jaradat on 1/30/17.
//  Copyright © 2017 Toleen Jaradat. All rights reserved.
//

//import UIKit
import XCTest
@testable import PhoneNumberCodeChallenge

class PhoneNumberCodeChallengeTests: XCTestCase {
    
    fileprivate var phoneNumber:PhoneNumber!
    fileprivate var storyboard :UIStoryboard!
    fileprivate var controller :PhoneNumberViewController!
    
    override func setUp() {
        super.setUp()
        
        storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    
        controller = storyboard.instantiateViewController(withIdentifier: "PhoneNumberViewController") as! PhoneNumberViewController
        
        _ = controller.view
        
        phoneNumber = PhoneNumber()
    }
    
    func testShouldCleanNumber() {
    
        controller.phoneNumberTextField.text = "(123) 456-7890"
        controller.goButtonPressed(UIButton())
        let result = controller.phoneNumberLbl.text
        XCTAssertTrue(result == "1234567890")
    }
    
    func testShouldCleanNumberWithDots() {
        
        controller.phoneNumberTextField.text = "123.456.7890"
        controller.goButtonPressed(UIButton())
        let result = controller.phoneNumberLbl.text
        XCTAssertTrue(result == "1234567890")
    }
    
    func testShouldBeValidWhen11DigitsAndFirstIs1() {
        
        controller.phoneNumberTextField.text = "11234567890"
        controller.goButtonPressed(UIButton())
        let result = controller.phoneNumberLbl.text
        XCTAssertTrue(result == "1234567890")
    }
    
    
    func testShouldBeInvalidWhen11Digits() {
        controller.phoneNumberTextField.text = "21234567890"
        controller.goButtonPressed(UIButton())
        let result = controller.phoneNumberLbl.text
        XCTAssertTrue( result == "0000000000")
    }
    
    func testShouldBeInvalidWhen9Digits() {
        controller.phoneNumberTextField.text = "123456789"
        controller.goButtonPressed(UIButton())
        let result = controller.phoneNumberLbl.text
        XCTAssertTrue(result == "0000000000")
    }

    func testShouldReturnAreaCode() {
        
        controller.phoneNumberTextField.text = "11234567890"
        controller.goButtonPressed(UIButton())
        let result = controller.areaCodeLbl.text
        XCTAssertTrue(result == "123")
    }
 
    func testShouldReturnPrettyPrint() {
    
        controller.phoneNumberTextField.text = "1234567890"
        controller.goButtonPressed(UIButton())
        let result = controller.formattedPhoneNumberLbl.text
        XCTAssertTrue(result == "(123) 456-7890")
      }
 
    func testShouldReturnPrettyPrintWithFullUSPhoneNumber() {
    
        controller.phoneNumberTextField.text = "11234567890"
        controller.goButtonPressed(UIButton())
        let result = controller.formattedPhoneNumberLbl.text
        XCTAssertTrue(result == "(123) 456-7890")
    }
    

}
