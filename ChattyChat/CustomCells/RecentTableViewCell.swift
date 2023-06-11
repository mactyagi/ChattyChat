//
//  RecentTableViewCell.swift
//  ChattyChat
//
//  Created by Manu on 11/06/23.
//

import UIKit

class RecentTableViewCell: UITableViewCell {

    //MARK: - Outlets
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var lastMessageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var unreadCounterLabel: UILabel!
    @IBOutlet weak var unreadCounterLabelView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        unreadCounterLabelView.layer.cornerRadius = unreadCounterLabelView.frame.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(recent: RecentChat){
        usernameLabel.text = recent.recieverName
        usernameLabel.adjustsFontSizeToFitWidth = true
        usernameLabel.minimumScaleFactor = 0.9
        lastMessageLabel.text = recent.lastMessage
        lastMessageLabel.adjustsFontSizeToFitWidth = true
        lastMessageLabel.minimumScaleFactor = 0.9
        lastMessageLabel.numberOfLines = 2
        if recent.unreadCount != 0{
            unreadCounterLabel.text = "\(recent.unreadCount)"
            self.unreadCounterLabelView.isHidden = false
        }else{
            unreadCounterLabelView.isHidden = true
        }
        setAvatar(avatarLink: recent.avatarLink)
        dateLabel.text = timeElapsed(recent.date ?? Date())
        dateLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setAvatar(avatarLink: String){
        if !avatarLink.isEmpty{
            FileStorage.downloadImage(imageURL: avatarLink) { image in
                self.avatarImageView.image = image?.circleMasked
            }
        }else{
            self.avatarImageView.image = UIImage(named: "avatar")?.circleMasked
        }
    }

}
