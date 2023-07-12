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
        loadChats()
        
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
        messageInputBar.inputTextView.isImagePasteEnabled = false
        messageInputBar.backgroundView.backgroundColor = .systemBackground
        messageInputBar.inputTextView.backgroundColor = .systemBackground
        
    }
    
    func loadChats(){
        let predicate = NSPredicate(format: "chatRoomId = %@", chatId)
        allLocalMessages = realm.objects(LocalMessage.self).filter(predicate).sorted(byKeyPath: kDATE, ascending: true)
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
    
    func messageSend(text: String?, photo: UIImage?, video: String?, audio: String?, location: String?, audioDuration: Float = 0.0){
        print(" sending text", text)
        OutgoingMessage.send(chatId: chatId, text: text, photo: photo, video: video, audio: audio, location: location, memberIds: [User.currentId, recipientId])
    }
}

