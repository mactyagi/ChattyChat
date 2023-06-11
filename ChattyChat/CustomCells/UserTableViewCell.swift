//
//  UserTableViewCell.swift
//  ChattyChat
//
//  Created by Manu on 11/06/23.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    //MARK: - IBOutlet
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(user: User){
        usernameLabel.text = user.username
        statusLabel.text = user.status
        setAvatar(avatarLink: user.avatarLink)
    }
    
    func setAvatar(avatarLink: String){
        if avatarLink.isEmpty{
            self.avatarImageView.image = UIImage(named: "avatar")?.circleMasked
        }else{
            FileStorage.downloadImage(imageURL: avatarLink) { image in
                self.avatarImageView.image = image?.circleMasked
            }
        }
    }

}
