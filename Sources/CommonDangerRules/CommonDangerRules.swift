import Danger

let danger = Danger()

final class CommonDangerRules {
    
    public static func doCodeReview() -> Void {
        let editedFiles = danger.git.modifiedFiles + danger.git.createdFiles
        message("These files have changed: \(editedFiles.joined())")
    }
    
}
