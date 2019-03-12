import Danger
import Foundation

public func checkForCopyrightHeaders() -> Void {
    let danger = Danger()
    
    let swiftFilesWithCopyright = danger.git.createdFiles.filter {
        $0.fileType == .swift
            && danger.utils.readFile($0).contains("//  Created by")
    }
    
    if swiftFilesWithCopyright.count > 0 {
        let files = swiftFilesWithCopyright.joined(separator: ", ")
        warn("Please don't include copyright headers, found them in: \(files)")
    }
}

public func messageEditedFiles() -> Void {
    let danger = Danger()
    
    let editedFiles = danger.git.modifiedFiles + danger.git.createdFiles
    message("These files have changed: \(editedFiles.joined())")
}
