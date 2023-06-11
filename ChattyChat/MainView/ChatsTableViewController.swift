//
//  ChatsTableViewController.swift
//  ChattyChat
//
//  Created by Manu on 11/06/23.
//

import UIKit

class ChatsTableViewController: UITableViewController {

   
    
    //MARK: - Vars
    var allRecents: [RecentChat] = []
    var filteredRecents: [RecentChat] = []
    let searchController = UISearchController(searchResultsController: nil)
    
    //MARK: - view lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadRecentChats()
        setupSearchController()
        tableView.sectionHeaderTopPadding = 0
    }
    
    
    //MARK: - IBAction
    @IBAction func composeButtonPressed(_ sender: UIBarButtonItem) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UsersTableViewController") as! UsersTableViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupSearchController(){
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search User"
        searchController.searchResultsUpdater = self
        definesPresentationContext = true
    }
    
    private func downloadRecentChats(){
        FirebaseRecentListener.shared.downloadRecentChatsFromFirestore { allRecents in
            DispatchQueue.main.async {
                self.allRecents = allRecents
                self.tableView.reloadData()
            }
        }
    }
    
    
    //MARK: - navigation
    func goToChat(recent: RecentChat){
        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //TODO: - continue chat with user and go to chat room
        let recent = searchController.isActive ? filteredRecents[indexPath.row] : allRecents[indexPath.row]
        FirebaseRecentListener.shared.clearUnreadCounter(recent: recent)
        goToChat(recent: recent)
        
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchController.isActive ? filteredRecents.count : allRecents.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RecentTableViewCell
        let recent = searchController.isActive ? filteredRecents[indexPath.row] : allRecents[indexPath.row]
        
        cell.configure(recent: recent)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let recent = searchController.isActive ? filteredRecents[indexPath.row] : allRecents[indexPath.row]
            FirebaseRecentListener.shared.deleteRecent(recent)
            
            searchController.isActive ? filteredRecents.remove(at: indexPath.row) : allRecents.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

extension ChatsTableViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        filteredContentForSearchText(searchText: searchController.searchBar.text!)
    }
    
    func filteredContentForSearchText(searchText: String){
        filteredRecents = allRecents.filter({ recent in
            return recent.recieverName.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}
