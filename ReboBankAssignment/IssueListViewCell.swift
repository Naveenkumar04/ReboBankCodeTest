//
//  IssueListViewCell.swift
//  ReboBankAssignment
//
//  Created by Naveen on 08/08/17.
//  Copyright © 2017 Cognizant Tech Solution. All rights reserved.
//

import UIKit

class IssueListViewCell: UITableViewCell {

    // MARK:- variables

    @IBOutlet weak var surName: UILabel!
    @IBOutlet weak var dateOfBirth: UILabel!
    @IBOutlet weak var issueCount: UILabel!
    @IBOutlet weak var firstName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // Method Description : This method is used to configureCell with data
    // Parameters : issue model
    // Return Type : NA
    
    func configureCell(issueItem : Issues){
        self.firstName.text = issueItem.firstName
        self.surName.text = issueItem.surName
        self.issueCount.text = String(issueItem.issuesCount)
        self.dateOfBirth.text = issueItem.dateOfBirth
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
