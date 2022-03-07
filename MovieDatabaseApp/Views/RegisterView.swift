
import Foundation
import UIKit

protocol RegisterViewDelegate: AnyObject {
    func goToMain(in view: LoginView)
}

class RegisterView: UIView {
    weak var delegate: RegisterViewControllerDelegate?
    lazy var usernameField: UITextField = {
        let usernameField = UITextField()
        usernameField.backgroundColor = .white
        usernameField.borderStyle = .roundedRect
        return usernameField
    }()
    
    lazy var passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.backgroundColor = .white
        passwordField.borderStyle = .roundedRect
        passwordField.isSecureTextEntry = true

        return passwordField
    }()
    
    lazy var firstName: UITextField = {
        let firstName = UITextField()
        firstName.backgroundColor = .white
        firstName.borderStyle = .roundedRect
        firstName.isSecureTextEntry = true

        return firstName
    }()
    
    lazy var lastName: UITextField = {
        let lastName = UITextField()
        lastName.backgroundColor = .white
        lastName.borderStyle = .roundedRect
        lastName.isSecureTextEntry = true

        return lastName
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        [self.usernameField,
         self.firstName,
         self.lastName,
         self.passwordField,
         self.buttonToMain
      ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    
    lazy var buttonToMain: UIButton = {
    
        let buttonToMain = UIButton()
        buttonToMain.setTitle("Register", for: .normal)
        buttonToMain.backgroundColor = .black
        buttonToMain.isUserInteractionEnabled = true
        let mainTap = UITapGestureRecognizer(target: self, action: #selector(handleButtonToMainTapped(sender:)))
        buttonToMain.addGestureRecognizer(mainTap)
        return buttonToMain
        
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setGeneralConfigurations()
        createSubviews()
        setUpConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setGeneralConfigurations()
        createSubviews()
        setUpConstraints()
    }
    
    func setGeneralConfigurations() {
        backgroundColor = .white
    }
    
    func createSubviews() {


        addSubview(stackView)
        
        
    
        
        
    }
    
    func setUpConstraints() {
        


        stackView.setSize(width: 400, height: 500)
        stackView.center(centerX: layoutMarginsGuide.centerXAnchor, centerY: layoutMarginsGuide.centerYAnchor)


        
      
    }
    
    @objc func handleButtonToMainTapped(sender: UITapGestureRecognizer) {
      
        delegate?.goToMainView()
    }
    
  
}
