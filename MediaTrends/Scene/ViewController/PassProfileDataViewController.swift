//
//  PassProfileDataViewController.swift
//  MediaTrends
//
//  Created by Taekwon Lee on 2023/08/29.
//

import UIKit

final class PassProfileDataViewController: BaseViewController {
    
    let mainView = PassProfileDataView()
    
    var delegate: PassDataDelegate?
    var completionHandler: ((String) -> Void)?
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        guard let textField = mainView.textField.text else { return }
        delegate?.receiveData(data: textField)
        completionHandler?(textField)
        NotificationCenter.default.post(
            name: NSNotification.Name("InputBio"),
            object: nil,
            userInfo: ["bio": textField]
        )
    }
    
    @objc
    func doneButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: NavigationBar

extension PassProfileDataViewController {
    private func configureNavigationBar() {
        title = "상세 정보 수정"
        
        navigationController?.navigationBar.topItem?.title = ""
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "완료",
            style: .plain,
            target: self,
            action: #selector(doneButtonClicked)
        )
    }
}
