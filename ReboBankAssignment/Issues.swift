//
//  Issues.swift
//  ReboBankAssignment
//
//  Created by Naveen on 07/08/17.
//  Copyright © 2017 Cognizant Tech Solution. All rights reserved.
//

import UIKit

struct Issues {
  
    // MARK:- variables

    var firstName: String
    var surName: String
    var issuesCount: Int
    var dateOfBirth: String
    
    // Method Description :
    // This method will initialise the data model
    
    init(firstName: String,
         surNmae: String,
         issuesCount: Int,
         dateOfBirth: String) {
        
        self.firstName = firstName
        self.surName = surNmae
        self.issuesCount = issuesCount
        self.dateOfBirth = dateOfBirth
    }
    
    
}
