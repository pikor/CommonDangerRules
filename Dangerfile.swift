import Danger
import Foundation

let danger = Danger()
    
public func doCodeReview() -> Void {
    let editedFiles = danger.git.modifiedFiles + danger.git.createdFiles
    message("These files have changed: \(editedFiles.joined())")
}
