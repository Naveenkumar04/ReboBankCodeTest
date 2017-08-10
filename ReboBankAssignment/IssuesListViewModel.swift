//
//  IssuesListViewModel.swift
//  ReboBankAssignment
//
//  Created by Naveen on 07/08/17.
//  Copyright © 2017 Cognizant Tech Solution. All rights reserved.
//

import UIKit



class IssuesListViewModel : NSObject {
    
    // MARK:- variables
    var issuesList = [Issues]() 
    var listHeaders = [String]()
    var appUtils = Utils()
    weak var issueListViewController = IssuesListViewController()


    override init() {
        super.init()
        self.issuesList = loadData()
    }
    
    // Method Description : This method is used to load the data from CSV file
    // Parameters : N/A
    // Return Type : Array of issues model
    
    func loadData() -> [Issues] {
        
            getStringFromCSVFileUrl(fileURL:appUtils.filePath(), completion: { [weak self] response in
                guard let strongSelf = self else { return}
                if response != "" {
                    print(response)
                    let isSuccess = strongSelf.parseCSVFileString(dataString: response)
                    if (isSuccess)
                    {
                        strongSelf.refereshData()
                    }
                }
        })
        return issuesList
    }
    
    // Method Description : This method is used referesh the tableview in view controller
    // Parameters : NA
    // Return Type : NA
    
    func refereshData() {
        self.issueListViewController?.issueListTable.reloadData()
    }
    
    
    // Method Description : This method is used to get the data as string from CSV file
    // Parameters : File URL
    // Return Type : NA
    
    func getStringFromCSVFileUrl( fileURL: URL?, completion: @escaping (_ success: String) -> Void) {
        
        //@escaping...If a closure is passed as an argument to a function and it is invoked after the function returns, the closure is @escaping.
        
        var inputString = ""
         if (fileURL?.absoluteString) != nil{
            do {
                inputString = try String(contentsOf: fileURL!)  //<-- error here
                print("dataString=\(inputString)")

            } catch let error as NSError {
                print("Failed reading data in appData Directory, Error: \(error.localizedDescription)")
            }
        }
        completion(inputString)
        
    }
    
    // Method Description : This method is used parse the string from csv file
    // Parameters : NA
    // Return Type : NA
    
    func parseCSVFileString(dataString : String) -> Bool{
        
        var isSucces = false
        let csvFileParser = CSVFileParser(with: dataString)
        let rows = csvFileParser.rows // [
        listHeaders = csvFileParser.headers
        print(rows)
        formIssuesListArray(parameter:rows, completion: { response in
            if response.count != 0 {
                isSucces = true
            }
            
        })
        return isSucces
    }
    
    // Method Description : This method is used to get the data as string from CSV file
    // Parameters : File URL
    // Return Type : NA
    
    func formIssuesListArray( parameter: [[String]], completion: @escaping (_ success: [Issues]) -> Void) {
        
        //@escaping...If a closure is passed as an argument to a function and it is invoked after the function returns, the closure is @escaping.
        self.issuesList.removeAll()
        for var i in (0..<parameter.count)
        {
            let issueRow = parameter[i] as Array
            let firstName = issueRow[0]
            let surName = issueRow[1]
            let issueCount = Int(issueRow[2])!
            let dateOfBirth = formatDate(dateString: issueRow[3])
            let issuesTemp = Issues.init(firstName: firstName, surNmae:surName, issuesCount: issueCount, dateOfBirth:dateOfBirth)
            self.issuesList.append(issuesTemp)
            i += 1
        }
            completion(self.issuesList)
        
    }
    
    // Method Description : This method is used to format the date
    // Parameters : Date String
    // Return Type : formatted date string
    
    func formatDate(dateString: String) -> String {
        
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: Constants.currentLocale) // set locale to reliable US_POSIX
        dateFormatter.dateFormat = Constants.sourceDateFormat
        let date = dateFormatter.date(from: dateString)!
        dateFormatter.dateFormat = Constants.requiredDateFormat
        dateFormatter.locale = tempLocale // reset the locale
        let dateStringTemp = dateFormatter.string(from: date)
        return dateStringTemp
        
    }
        
    
}
