//
//  ChatViewController.swift
//  ChattyChat
//
//  Created by Manu on 12/06/23.
//

import UIKit
import MessageKit
import InputBarAccessoryView
import Gallery
import RealmSwift

class ChatViewController: MessagesViewController {

    //MARK: -  Views
    let leftBarView: UIView = {
       return UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
    }()
    
    let titleLabel: UILabel = {
       let title = UILabel(frame: CGRect(x: 5, y: 0, width: 140, height: 25))
        title.textAlignment = .left
        title.font = .systemFont(ofSize: 16, weight: .medium)
        title.adjustsFontSizeToFitWidth = true
        return title
    }()
    
    let subTitleLabel: UILabel = {
       let subTitle = UILabel(frame: CGRect(x: 5, y: 22, width: 140, height: 25))
        subTitle.textAlignment = .left
        subTitle.font = .systemFont(ofSize: 13, weight: .medium)
        subTitle.adjustsFontSizeToFitWidth = true
        return subTitle
    }()
    
    
    //MARK: -  vars
    private var chatId = ""
    private var recipientId = ""
    private var recipientName = ""
    let currentUser = MKSender(senderId: User.currentId, displayName: User.currentUser!.username)
    let refreshControl = UIRefreshControl()
    let mikeButton = InputBarButtonItem()
    var mkMessages: [MKMessage] = []
    
    var allLocalMessages: Results<LocalMessage>!
    let realm = try! Realm()
    
    //Listner
    var notificationToken: NotificationToken?
    
    //MARK: - Inits
    
    init(chatId: String , recipientId: String, recipientName: String) {
        super.init(nibName: nil, bundle: nil)
        self.chatId = chatId
        self.recipientId = recipientId
        self.recipientName = recipientName
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    //MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMessageInputBar()
        configureMessageCollectionView()
        configureLeftBarButton()
        configureCustomTitle()
        loadChats()
        listenForNewChats()
        
    }
    
    private func configureMessageCollectionView(){
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messageCellDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messagesCollectionView.messagesLayoutDelegate = self
        scrollsToLastItemOnKeyboardBeginsEditing = true
        maintainPositionOnKeyboardFrameChanged = true
        messagesCollectionView.refreshControl = refreshControl
    }
    
    private func configureMessageInputBar(){
        messageInputBar.delegate = self
        let attachButton = InputBarButtonItem()
        attachButton.image = UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        attachButton.setSize(CGSize(width: 30, height: 30), animated: false)
        attachButton.onTouchUpInside { item in
            print("attach button pressed")
        }
        mikeButton.image = UIImage(systemName: "mic.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        mikeButton.setSize(CGSize(width: 30, height: 30), animated: false)
        // add gesture recognizer
        
        messageInputBar.setStackViewItems([attachButton], forStack: .left, animated: false)
        messageInputBar.setLeftStackViewWidthConstant(to: 36, animated: false)
        updateMicButtonStatus(show: true)
        messageInputBar.inputTextView.isImagePasteEnabled = false
        messageInputBar.backgroundView.backgroundColor = .systemBackground
        messageInputBar.inputTextView.backgroundColor = .systemBackground
        
    }
    
    func updateMicButtonStatus(show: Bool){
        if show{
            messageInputBar.setStackViewItems([mikeButton], forStack: .right, animated: false)
            messageInputBar.setRightStackViewWidthConstant(to: 30, animated: false)
        }else{
            messageInputBar.setStackViewItems([messageInputBar.sendButton], forStack: .right, animated: false)
            messageInputBar.setRightStackViewWidthConstant(to: 55, animated: false)
        }
    }
    
    func configureLeftBarButton(){
        self.navigationItem.leftBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonPressed))]
    }
    
    
    func configureCustomTitle(){
        leftBarView.addSubview(titleLabel)
        leftBarView.addSubview(subTitleLabel)
        let leftBarButtonItem = UIBarButtonItem(customView: leftBarView)
        self.navigationItem.leftBarButtonItems?.append(leftBarButtonItem)
        titleLabel.text = recipientName
    }
    
    
    
    func loadChats(){
        let predicate = NSPredicate(format: "chatRoomId = %@", chatId)
        allLocalMessages = realm.objects(LocalMessage.self).filter(predicate).sorted(byKeyPath: kDATE, ascending: true)
        if allLocalMessages.isEmpty{
            checkForOldChats()
        }
        notificationToken = allLocalMessages.observe({ change in
            switch change{
                
            case .initial(_):
                self.insertMessages()
                self.messagesCollectionView.reloadData()
                self.messagesCollectionView.scrollToLastItem(animated: true)
            case .update(_, deletions: let deletions, insertions: let insertions, modifications: let modifications):
                for index in insertions{
                    self.insertMessage(self.allLocalMessages[index])
                    self.messagesCollectionView.reloadData()
                    self.messagesCollectionView.scrollToLastItem(animated: false)
                }
                
            case .error(let error):
                print("eron on new ensertion \(error.localizedDescription)")
            }
        })
    }
    
    private func listenForNewChats(){
        FirebaseMessageListner.shared.listenForNewChats(User.currentId, collectionId: chatId, lastMessageDate: lastMessageDate())
    }
    
    private func checkForOldChats(){
        FirebaseMessageListner.shared.checkForOldChats(User.currentId, collectionId: chatId)
    }
    
    
    private func insertMessages(){
        for message in allLocalMessages {
            insertMessage(message)
        }
    }
    
    private func insertMessage(_ localMessage: LocalMessage){
        let incoming = IncomingMessage(collectionView: self)
        mkMessages.append(incoming.createMessage(localMessage: localMessage)!)
    }
    
    //MARK: - Actions
    
    @objc func backButtonPressed(){
        //TODO remove listners
        
        navigationController?.popToRootViewController(animated: true)
    }
    func messageSend(text: String?, photo: UIImage?, video: String?, audio: String?, location: String?, audioDuration: Float = 0.0){
        print(" sending text", text)
        OutgoingMessage.send(chatId: chatId, text: text, photo: photo, video: video, audio: audio, location: location, memberIds: [User.currentId, recipientId])
    }
    
    
    //MARK: - update Typing Indicator
    func updateTypingIndicator(_ show: Bool){
        self.subTitleLabel.text = show ? "Typing..." : ""
    }
    
    //MARK: - Helpers
    private func lastMessageDate() -> Date{
        let lastMessageDate = allLocalMessages.last?.date ?? Date()
        return Calendar.current.date(byAdding: .second, value: 1, to: lastMessageDate) ?? lastMessageDate
    }
}

