//
//  ViewController.swift
//  House
//
//  Created by User on 1/23/22.
//

import UIKit
import AuthenticationServices

class FirstViewController: UIViewController, Stroyboarded {
    
    let signInButton = ASAuthorizationAppleIDButton()
    
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
        view.addSubview(signInButton)
        signInButton.frame = CGRect(x: 0, y: 0, width: 250, height: 50)
        signInButton.center = view.center
        signInButton.addTarget(self, action: #selector(handleSignInAction), for: .touchUpInside)
    }

    @IBAction func openProfileAction(_ sender: UIButton) {
        coordinator?.openProfile()
    }
    
    @objc
    private func handleSignInAction() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authController = ASAuthorizationController(authorizationRequests: [request])
        authController.delegate = self
        authController.presentationContextProvider = self
        authController.performRequests()
    }
    
}

// MARK: - ASAuthorizationControllerDelegate

extension FirstViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("auth error ", error.localizedDescription)
    }
    
    func authorizationController(controller: ASAuthorizationController,
                                 didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            UserDefaults.isUserLoggedIn = true
            UserDefaults.userAppleAuthID = appleIDCredential.user
            UserDefaults.userFullName = appleIDCredential.fullName ?? PersonNameComponents()
            UserDefaults.userEmail = appleIDCredential.email ?? ""
        case let passwordCredential as ASPasswordCredential:
            _ = passwordCredential.user
            _ = passwordCredential.password
        default:
            break
        }

    }
}

extension FirstViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
    
}
