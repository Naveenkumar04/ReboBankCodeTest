//
//  IssuesListViewController.swift
//  ReboBankAssignment
//
//  Created by Naveen on 07/08/17.
//  Copyright © 2017 Cognizant Tech Solution. All rights reserved.
//

import UIKit



class IssuesListViewController: UIViewController , UITableViewDataSource,UITableViewDelegate {
    
    // MARK:- variables

    @IBOutlet weak var issueListTable: UITableView!
    var issuesListData = [Issues]()
    var refreshControl: UIRefreshControl!
    var appUtilis = Utils()
    var issueListDataViewModel:IssuesListViewModel?
    
    // MARK:- UIViewController Delegate

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Constants.appTitle
        if !appUtilis.isFileExist() {
            fileNotFoundAlert()
            return
        }
        let issueListModelView = IssuesListViewModel()
        self.issuesListData = issueListModelView.issuesList

        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewDidAppear(true)
        issueListDataViewModel?.refereshData()

    }
    // Method Description : This method is used to load the data from view model
    // Parameters : N/A
    // Return Type : Array of issues model
    
    func loadListArray() {
        // load data list array from the data view model asyncronusly
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let strongSelf = self else { return }
            
            DispatchQueue.main.async { // 2
                strongSelf.issueListTable.reloadData()

            }
        }
    }
    
    // MARK: - UITableViewDataSource
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issuesListData.count 
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.issueListTableCellId, for: indexPath) as! IssueListViewCell
        let issueValue = issuesListData[indexPath.row] as Issues
        cell.configureCell(issueItem: issueValue)
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    
    // Method Description : This method is used to show alert when no files available
    // Parameters : N/A
    // Return Type : NA
    
    func fileNotFoundAlert() {
        let alert = UIAlertController(title: Constants.appTitle, message: Constants.csvFileNotFoundErrorMessage, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: Constants.alertOKbuttonTitle, style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
   
    
    
//    func refresh(sender:AnyObject) {
//        // Code to refresh table view
//        issueListTable.reloadData()
//        refreshControl.endRefreshing()
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
