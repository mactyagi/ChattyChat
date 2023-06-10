//
//  EditProfileTableViewController.swift
//  ChattyChat
//
//  Created by Manu on 10/06/23.
//

import UIKit

class EditProfileTableViewController: UITableViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        configureTextField()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showUserInfo()
    }
    
    //MARK: - updateUI
    func showUserInfo(){
        if let user = User.currentUser{
            userNameTextField.text = user.username
            statusLabel.text = user.status
            if user.avatarLink != ""{
                //set avatar
            }
        }
    }
    
    private func configureTextField(){
        userNameTextField.delegate = self
        userNameTextField.clearButtonMode = .whileEditing
    }
}



//MARK: - tableView Delegate
extension EditProfileTableViewController{
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0 : 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // show status view
    }
}

extension EditProfileTableViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField{
            if textField.text != ""{
                if var user = User.currentUser{
                    user.username = textField.text!
                    saveUserLocally(user)
                    FirebaseUserListner.shared.saveUserToFireStore(user)
                }
            }
            textField.resignFirstResponder()
            return false
        }
        return true
    }
}
