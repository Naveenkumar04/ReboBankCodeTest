//
//  Utils.swift
//  ReboBankAssignment
//
//  Created by Naveen on 08/08/17.
//  Copyright © 2017 Cognizant Tech Solution. All rights reserved.
//

import UIKit

class Utils: NSObject {
    
    override init() {
        super.init()
    }

    // Method Description : 
    // This method is used to check whether the CSV file is availble to parse
    // Parameters : N/A
    // Return Type : Bool
    
    func isFileExist() -> Bool {
        
        if Bundle.main.url(forResource: Constants.fileName, withExtension:Constants.fileType) != nil {
            return true
        }
        else{
            return false
        }
        
    }
    // Method Description :
    // This method is used to get the CSV file in the bundle
    // Parameters : N/A
    // Return Type : URL
    
    func filePath() -> URL {
        
        var fileURL = URL.init(string: "")
        if isFileExist() {
            fileURL = Bundle.main.url(forResource: Constants.fileName, withExtension:Constants.fileType)
        }
        return (fileURL ?? nil)!
    }
    
}
