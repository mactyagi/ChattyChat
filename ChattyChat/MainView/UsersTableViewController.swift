//
//  UsersTableViewController.swift
//  ChattyChat
//
//  Created by Manu on 11/06/23.
//

import UIKit

class UsersTableViewController: UITableViewController {

    //MARK: - vars
    var allUsers: [User] = []
    var filteredUsers: [User] = []
    let searchController = UISearchController(searchResultsController: nil)
    
    //MARK: - viewLife
    override func viewDidLoad() {
        super.viewDidLoad()
//        createDummyUser()
        self.refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
        setupSearchController()
        downloadUsers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupSearchController(){
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search User"
        searchController.searchResultsUpdater = self
        definesPresentationContext = true
    }
    
    func downloadUsers(){
        FirebaseUserListner.shared.downloadAllUsersFromFirebase { allUsers in
            self.allUsers = allUsers
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        if refreshControl!.isRefreshing{
            self.downloadUsers()
            self.refreshControl!.endRefreshing()
        }
    }

    func showUserProfile(_ user: User){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileTableViewController") as! ProfileTableViewController
        vc.user = user
        navigationController?.pushViewController(vc, animated: true)
        
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchController.isActive ? filteredUsers.count : allUsers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserTableViewCell
        
        let user = searchController.isActive ? filteredUsers[indexPath.row] : allUsers[indexPath.row]
        cell.configure(user: user)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let user = searchController.isActive ? filteredUsers[indexPath.row] : allUsers[indexPath.row]
        showUserProfile(user)
    }
}

extension UsersTableViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        filteredContentForSearchText(searchText: searchController.searchBar.text!)
    }
    
    func filteredContentForSearchText(searchText: String){
        filteredUsers = allUsers.filter({ user in
            return user.username.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}
