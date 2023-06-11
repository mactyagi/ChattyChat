//
//  FirebaseStorage.swift
//  ChattyChat
//
//  Created by Manu on 11/06/23.
//

import Foundation
import FirebaseStorage
import ProgressHUD

let storage = Storage.storage()
class FileStorage{
    
    //Images
    class func uploadImage(_ image: UIImage, directory: String, completion: @escaping (_ documentLink: String?) ->()){
        
        let storageRef = storage.reference(forURL: kFILEREFERENCE).child(directory)
        let imageData = image.jpegData(compressionQuality: 0.6)
        var task: StorageUploadTask!
        task = storageRef.putData(imageData!, metadata: nil) { metadata, error in
            task.removeAllObservers()
            ProgressHUD.dismiss()
            if let error = error{
                print("error uploading image \(error.localizedDescription)")
                return
            }
            
            storageRef.downloadURL { url, error in
                guard let downloadUrl = url else{
                    completion(nil)
                    return
                }
                completion(downloadUrl.absoluteString)
            }
        }
        
        task.observe(.progress) { snapshot in
            let progress = snapshot.progress!.completedUnitCount / snapshot.progress!.totalUnitCount
            ProgressHUD.showProgress(CGFloat(progress))
        }
    }
    
    class func downloadImage(imageURL: String, completion: @escaping (_ image: UIImage?) -> ()){
        let imageFileName = fileNameFrom(fileUrl: imageURL)
        if fileExistAtPath(path: imageFileName){
            print("we have local image")
            
            if let contentsOfFile = UIImage(contentsOfFile: fileInDocumentDirectory(fileName: imageFileName)){
                completion(contentsOfFile)
            }else{
                print("couldn't convert local image")
                completion(UIImage(named: "avatar"))
            }
        }else{
            print("lets get from firebase")
            if !imageURL.isEmpty{
                let documentUrl = URL(string: imageURL)
                let downloadQueue = DispatchQueue(label: "imageDownloadQueue")
                
                downloadQueue.async {
                    if let data = NSData(contentsOf: documentUrl!){
                        // save locally
                        FileStorage.saveFileLocally(fileData: data, fileName: imageFileName)
                        DispatchQueue.main.async {
                            completion(UIImage(data: data as Data))
                        }
                        
                    }else{
                        print("no document in database")
                        completion(nil)
                    }
                    
                }
            }
        }
    }
    
    class func saveFileLocally(fileData: NSData, fileName: String){
        let docURL = getDocumentsURL().appendingPathComponent(fileName, isDirectory: false)
        fileData.write(to: docURL, atomically: true)
    }
}



//Helpers
func getDocumentsURL() -> URL{
    return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
}

func fileInDocumentDirectory(fileName: String) -> String{
    return getDocumentsURL().appendingPathComponent(fileName).path
}

func fileExistAtPath(path: String) -> Bool{
    return FileManager.default.fileExists(atPath: fileInDocumentDirectory(fileName: path))
}
