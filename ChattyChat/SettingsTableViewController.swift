//
//  SettingsTableViewController.swift
//  ChattyChat
//
//  Created by Manu on 10/06/23.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var appVersionLabel: UILabel!
    
    
    //MARK: - ViewLife Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showUserInfo()
    }
    
    

    //MARK: - IBActions
    @IBAction func tellAButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func termAndConditionButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        FirebaseUserListner.shared.logoutCurrentUser { error in
            if let error = error{
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                DispatchQueue.main.async {
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }
            }else{
                
            }
        }
    }
    
    
        //MARK: - UpdateUI
    
    private func showUserInfo(){
        if let user = User.currentUser{
            userNameLabel.text = user.username
            statusLabel.text = user.status
            appVersionLabel.text = "App version \(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "")"
            if user.avatarLink != ""{
                //  download and set images
            }
        }
        
    }
}


//MARK: - tableView Delegate
extension SettingsTableViewController{
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0 : 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath == IndexPath(row: 0, section: 0){
            performSegue(withIdentifier: "settingToEditProfileSeg", sender: self)
        }
    }
}
