//
//  ViewController.swift
//  ChattyChat
//
//  Created by Manu on 10/06/23.
//

import UIKit
import ProgressHUD

class LoginViewController: UIViewController {

    //MARK: - IBOutlets
    // labels
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var repeatPasswordLabel: UILabel!
    @IBOutlet weak var signUpLabel: UILabel!
    
    // textfields
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    
    // button
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var resendEmailButton: UIButton!
    
    //View
    @IBOutlet weak var repeatPasswordLineView: UIView!
    
    //MARK: - vars
    var isLogin = true
    
    //MARK: - view lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUIFor(login: isLogin)
        setupTextFieldDelegates()
        setupBackgroundTap()
    }


    
    //MARK: - IBActions
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if isDataInputedFor(type: isLogin ? "login" : "register"){
            
        }else{
            ProgressHUD.showFailed("All  Fields are required")
        }
    }
    
    @IBAction func resendEmailButtonPressed(_ sender: UIButton) {
        if isDataInputedFor(type: "password"){
            
        }else{
            ProgressHUD.showFailed("Email is required")
        }
    }
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        updateUIFor(login: sender.titleLabel?.text == "Login")
        isLogin.toggle()
    }
    
    @IBAction func forgotPasswordButtonPressed(_ sender: UIButton) {
        if isDataInputedFor(type: "password"){
            
        }else{
            ProgressHUD.showFailed("Email is required")
        }
    }
    
        //MARK: - setup
    private func setupTextFieldDelegates(){
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        repeatPasswordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textfield: UITextField){
        updatePlaceholderLabels(textfield: textfield)
    }
    
    private func setupBackgroundTap(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func backgroundTap(){
        view.endEditing(true)
    }
    
    //MARK: - Animations
    
    private func updateUIFor(login: Bool){
        loginButton.setImage(UIImage(named: login ? "loginBtn" : "registerBtn"), for: .normal)
        signUpButton.setTitle(login ? "Sign Up" : "Login", for: .normal)
        
        signUpLabel.text = login ? "Don't have an account?" : "Have an account?"
        
        UIView.animate(withDuration: 0.5) {
            self.repeatPasswordTextField.isHidden = login
            self.repeatPasswordLabel.isHidden = login
            self.repeatPasswordLineView.isHidden = login
        }
    }
    
    private func updatePlaceholderLabels(textfield: UITextField){
        switch textfield{
        case emailTextField:
            emailLabel.text = textfield.hasText ? "Email" : ""
        case passwordTextField:
            passwordLabel.text = textfield.hasText ? "Password": ""
        default:
            repeatPasswordLabel.text = textfield.hasText ? "Repeat Password": ""
            
        }
    }
    
    //MARK: - Helpers
    private func isDataInputedFor(type: String) -> Bool{
        switch type {
        case "login":
            return emailTextField.text != "" && passwordTextField.text != ""
        case "register":
            return emailTextField.text != "" && passwordTextField.text != "" && repeatPasswordTextField.text != ""
        default:
            return emailTextField.text != ""
        }
    }
    
}

