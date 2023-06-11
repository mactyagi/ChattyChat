//
//  ProfileTableViewController.swift
//  ChattyChat
//
//  Created by Manu on 11/06/23.
//

import UIKit

class ProfileTableViewController: UITableViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    
    //MARK: - vars
    var user: User?
    
    //MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.sectionHeaderTopPadding = 0
        navigationItem.largeTitleDisplayMode = .never
        setupUI()
    }
    
    func setupUI(){
        if let user = user{
            self.title = user.username
            usernameLabel.text = user.username
            statusLabel.text = user.status
            if !user.avatarLink.isEmpty{
                FileStorage.downloadImage(imageURL: user.avatarLink) { image in
                    self.avatarImageView.image = image?.circleMasked
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        section == 0 ? 0 : 5
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 1{
            // Start chat
        }
    }
}
