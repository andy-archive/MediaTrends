//
//  EditViewController.swift
//  MediaTrends
//
//  Created by Taekwon Lee on 2023/08/29.
//

import UIKit

protocol PassDataDelegate {
    func receiveData(data: String)
}

final class EditViewController: BaseViewController {
    
    private let mainView = EditView()
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
    }
    
    override func configureView() {
        super.configureView()
    }
    
    override func setConstraints() {
    }
    
    @objc
    func cancelButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    func doneButtonClicked() {
        navigationController?.popViewController(animated: true)
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
