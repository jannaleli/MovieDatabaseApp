import UIKit
final class TableViewDelegate: NSObject, UITableViewDelegate {


    func tableView(_: UITableView, willDisplay: UITableViewCell, forRowAt: IndexPath){
        
        
    }
    func tableView(_: UITableView, indentationLevelForRowAt: IndexPath) -> Int
    {
        return 1
    }
    
    func tableView(_: UITableView, shouldSpringLoadRowAt: IndexPath, with: UISpringLoadedInteractionContext) -> Bool {
        return true
    }
    
}
