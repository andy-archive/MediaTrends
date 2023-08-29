//
//  EditViewController.swift
//  MediaTrends
//
//  Created by Taekwon Lee on 2023/08/29.
//

import UIKit

final class EditViewController: BaseViewController {
    
    private let mainView = EditView()
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(bioButtonNotificationObserver(notification:)),
            name: .selectString,
            object: nil
        )
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationCenter.default.removeObserver(
            self,
            name: .selectString,
            object: nil
        )
    }
    
    override func configureView() {
        super.configureView()
        
        title = "프로필 편집"
        
        mainView.nameInfoButton.addTarget(
            self,
            action: #selector(nameInfoButtonClicked),
            for: .touchUpInside
        )
        mainView.usernameInfoButton.addTarget(
            self,
            action: #selector(usernameInfoButtonClicked),
            for: .touchUpInside
        )
        mainView.bioButton.addTarget(
            self,
            action: #selector(bioButtonClicked),
            for: .touchUpInside
        )
    }
    
    @objc
    func cancelButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    func doneButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    func nameInfoButtonClicked() { // delegate를 통한 값 전달
        let vc = PassProfileDataViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func usernameInfoButtonClicked() { // closure를 통한 값 전달
        let vc = PassProfileDataViewController()
        vc.completionHandler = { text in
            self.mainView.usernameInfoButton.setTitle(text, for: .normal)
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func bioButtonNotificationObserver(notification: NSNotification) { // notification을 통한 값 전달
        if let name = notification.userInfo?["bio"] as? String {
            mainView.bioButton.setTitle(name, for: .normal)
        }
    }
    
    @objc
    func bioButtonClicked() {
        let vc = PassProfileDataViewController()
        guard let textField = vc.mainView.textField.text else { return }
        
        NotificationCenter.default.post(
            name: NSNotification.Name("InputBio"),
            object: nil,
            userInfo: ["bio": textField]
        )
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: NavigationBar

extension EditViewController {
    private func configureNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "취소",
            style: .plain,
            target: self,
            action: #selector(cancelButtonClicked)
        )
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "완료",
            style: .plain,
            target: self,
            action: #selector(doneButtonClicked)
        )
    }
}

//MARK: PassDataDelegate

extension EditViewController: PassDataDelegate {
    func receiveData(data: String) {
        mainView.nameInfoButton.setTitle("\(data)", for: .normal)
    }
}
