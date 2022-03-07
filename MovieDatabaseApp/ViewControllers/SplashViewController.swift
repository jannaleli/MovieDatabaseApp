

import Foundation
import UIKit

public protocol SplashViewControllerDelegate: AnyObject {

    func goToLogin()
    func goToRegister()
    
}

class SplashViewController: UIViewController {

    
    weak var delegate: SplashCoordinatorDelegate?
    var splashView = SplashView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        splashView.delegate = self
        view = splashView
    }
    

}

extension SplashViewController: SplashViewControllerDelegate {
    func goToLogin() {

        delegate?.goToLogin()
     
    }
     
    func goToRegister() {
     
        delegate?.goToRegister()
     }
}




