

import Foundation
import UIKit

public protocol SplashViewControllerDelegate: AnyObject {
    func goToLogin()
    func goToRegister()
}

class SplashViewController: UIViewController {
    // MARK: - Public Properties

    weak var delegate: SplashViewControllerDelegate?
    var splashView = SplashView()

    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        MovieListAPI().getMovies(completionBlock: {
            _, _ in
        })
        splashView.delegate = self
        view = splashView
    }
}

extension SplashViewController: SplashViewDelegate {
    func goToLogin() {
        delegate?.goToLogin()
    }

    func goToRegister() {
        delegate?.goToRegister()
    }
}
