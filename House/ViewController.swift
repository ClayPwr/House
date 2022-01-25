//
//  ViewController.swift
//  House
//
//  Created by User on 1/23/22.
//

import UIKit
import AuthenticationServices

class ViewController: UIViewController, Stroyboarded {
    
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

extension ViewController: ASAuthorizationControllerDelegate {
    
}

extension ViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        ASPresentationAnchor()
    }
    
    
}
