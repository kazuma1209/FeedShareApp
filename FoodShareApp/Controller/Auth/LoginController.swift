//
//  LoginController.swift
//  FoodShareApp
//
//  Created by 坂田一真 on 2021/05/03.
//

import UIKit

class LoginController:UIViewController{
    
    //MARK: -プロパティー
    
    private var viewModel = LoginViewModel()
    
    private let iconImage:UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "タイトルロゴ"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private let emailTextField:UITextField = {
        let tf = CustomTextField(placeholder: "メールアドレス")
        return tf
    }()
    
    private let passwordTextField:UITextField = {
        let tf = CustomTextField(placeholder: "パスワード")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let loginButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ログイン！", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1).withAlphaComponent(0.5)
        button.layer.cornerRadius = 5
        button.setHeight(50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.isEnabled = false
        return button
    }()
    
    private let forgotPasswordButton:UIButton = {
        let button = UIButton(type: .system)
        button.attributeTitle(firstPart: "パスワードを忘れた", secondPart: "ヘルプへ")
        
        return button
    }()
    
    private let dontHaveAccountButton:UIButton = {
        let button = UIButton(type: .system)
        button.attributeTitle(firstPart: "アカウントを持っていない", secondPart: "ここをクリック!")
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        
        return button
    }()

    //MARK: -ライフサイクル
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureNotificationObserver()
        
    }
    //MARK: -セレクター
    @objc func handleShowSignUp(){
        let controller = RegistrationController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func textDidChange(sender: UITextField){
        if sender == emailTextField{
            viewModel.email = sender.text
        }else{
            viewModel.password = sender.text
        }
        
        updateForm()
    }
    //MARK: -ヘルパー
    func configureUI(){
        view.backgroundColor = .black
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.setDimensions(height: 80, width: 120)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor,paddingTop: 32)
        
        let stack = UIStackView(arrangedSubviews: [emailTextField,passwordTextField,loginButton,forgotPasswordButton])
        stack.axis = .vertical
        stack.spacing = 20
        
        view.addSubview(stack)
        stack.anchor(top: iconImage.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,
                     paddingTop: 32,paddingLeft: 32,paddingRight: 32)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerX(inView: view)
        dontHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
        
        
    }
    func configureNotificationObserver(){
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }

}

//MARK: -FormViewModek
extension LoginController:FormViewModel{
    func updateForm() {
        loginButton.backgroundColor = viewModel.buttonBackgroundColor
        loginButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        loginButton.isEnabled = viewModel.formIsValid
    }
}
