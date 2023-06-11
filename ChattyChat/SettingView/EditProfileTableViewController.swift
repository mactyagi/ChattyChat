//
//  EditProfileTableViewController.swift
//  ChattyChat
//
//  Created by Manu on 10/06/23.
//

import UIKit
import Gallery
import ProgressHUD
class EditProfileTableViewController: UITableViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    
    //MARK: - Vars
    var gallery: GalleryController!
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
    
    //MARK: - IBAction
    
   @IBAction func editButtonPressed(){
        showImageGallery()
    }
    
    //MARK: - updateUI
    func showUserInfo(){
        if let user = User.currentUser{
            userNameTextField.text = user.username
            statusLabel.text = user.status
            if user.avatarLink != ""{
                FileStorage.downloadImage(imageURL: user.avatarLink) { image in
                    DispatchQueue.main.async {
                        self.avatarImageView.image = image?.circleMasked
                    }
                }
            }
        }
    }
    
    private func configureTextField(){
        userNameTextField.delegate = self
        userNameTextField.clearButtonMode = .whileEditing
    }
    
    
    func showImageGallery(){
        self.gallery = GalleryController()
        self.gallery.delegate = self
        Config.tabsToShow = [.imageTab, .cameraTab]
        Config.Camera.imageLimit = 1
        Config.initialTab = .imageTab
        self.present(gallery, animated: true)
    }
    
    
    private func uploadAvatarImage(_ image: UIImage){
        let fileDirectory = "Avatars/" + "_\(User.currentId)" + ".jpg"
        FileStorage.uploadImage(image, directory: fileDirectory) { documentLink in
            if var user = User.currentUser{
                user.avatarLink = documentLink ?? ""
                saveUserLocally(user)
                FirebaseUserListner.shared.saveUserToFireStore(user)
            }
            // todo Save Image locally
            FileStorage.saveFileLocally(fileData: image.jpegData(compressionQuality: 1)! as NSData, fileName: User.currentId)
        }
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
        if indexPath == IndexPath(row: 0, section: 1){
            performSegue(withIdentifier: "editProfileToStatusSeg", sender: self)
        }
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


extension EditProfileTableViewController: GalleryControllerDelegate{
    func galleryController(_ controller: Gallery.GalleryController, didSelectImages images: [Gallery.Image]) {
        if let image = images.first{
            image.resolve { avatarImage in
                //TODO: - upload image
                
                if let image = avatarImage{
                    self.uploadAvatarImage(image)
                    self.avatarImageView.image = image.circleMasked
                }else{
                    ProgressHUD.showError("couldn't select image")
                }
                
            }
        }
        controller.dismiss(animated: true)
    }
    
    func galleryController(_ controller: Gallery.GalleryController, didSelectVideo video: Gallery.Video) {
        controller.dismiss(animated: true)
    }
    
    func galleryController(_ controller: Gallery.GalleryController, requestLightbox images: [Gallery.Image]) {
        controller.dismiss(animated: true)
    }
    
    func galleryControllerDidCancel(_ controller: Gallery.GalleryController) {
        controller.dismiss(animated: true)
    }
    
    
}
