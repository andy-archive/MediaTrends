//
//  ProfileViewController.swift
//  SeSAC3PhotoGram
//
//  Created by Taekwon Lee on 2023/08/29.
//

import UIKit

final class ProfileViewController: BaseViewController {
    
    private let mainView = ProfileView()
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
    }
    
    override func configureView() {
        super.configureView()
        
        title = "내 프로필"
        
        mainView.editButton.addTarget(
            self,
            action: #selector(editButtonClicked),
            for: .touchUpInside
        )
    }

    @objc
    func listButtonClicked() {
    }
    
    @objc
    func editButtonClicked() {
        let vc = EditViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: NavigationBar

extension ProfileViewController {
    private func configureNavigationBar() {
        let profileImage = UIImage(systemName: "list.dash")
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: profileImage,
            style: .plain,
            target: self,
            action: #selector(listButtonClicked)
        )
    }
}

