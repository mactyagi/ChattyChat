//
//  StatusTableViewController.swift
//  ChattyChat
//
//  Created by Manu on 11/06/23.
//

import UIKit

class StatusTableViewController: UITableViewController {
    
    //MARK: - Vars
    var allStatuses: [String] = []

        //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserStatus()
    }
    
    
    private func loadUserStatus(){
        allStatuses = UserDefaults.standard.object(forKey: kSTATUS) as! [String]
        tableView.reloadData()
        
    }

    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allStatuses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let status = allStatuses[indexPath.row]
        cell.textLabel?.text = status
        cell.accessoryType = User.currentUser?.status == status ? .checkmark : .none
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        updateCellCheck(indexPath)
        tableView.reloadData()
    }
    
    private func updateCellCheck(_ indexPath: IndexPath){
        if var user = User.currentUser{
            user.status = allStatuses[indexPath.row]
            saveUserLocally(user)
            FirebaseUserListner.shared.saveUserToFireStore(user)
        }
    }

   
}
