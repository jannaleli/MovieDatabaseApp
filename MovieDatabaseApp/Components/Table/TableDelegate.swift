import UIKit
final class TableViewDelegate: NSObject, UITableViewDelegate {
    func tableView(_: UITableView, willDisplay _: UITableViewCell, forRowAt _: IndexPath) {}

    func tableView(_: UITableView, indentationLevelForRowAt _: IndexPath) -> Int {
        return 1
    }

    func tableView(_: UITableView, shouldSpringLoadRowAt _: IndexPath, with _: UISpringLoadedInteractionContext) -> Bool {
        return true
    }
}
