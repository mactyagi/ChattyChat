//
//  GlobalFunctions.swift
//  ChattyChat
//
//  Created by Manu on 11/06/23.
//

import Foundation
func fileNameFrom(fileUrl: String) -> String{
    let name = (fileUrl.components(separatedBy: "_").last)?.components(separatedBy: ".").first
    
    return name!
}
