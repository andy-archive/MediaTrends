//
//  ProfileView.swift
//  MediaTrends
//
//  Created by Taekwon Lee on 2023/08/29.
//

import UIKit

final class ProfileView: BaseView {
    
    let editButton = {
        let view = UIButton()
        view.backgroundColor = .systemGray2
        view.titleLabel?.font = .boldSystemFont(ofSize: 15)
        view.setTitle("프로필 편집", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.layer.cornerRadius = 10
        return view
    }()
    
    override func configureView() {
        addSubview(editButton)
    }
    
    override func setConstraints() {
        editButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(8)
            make.leadingMargin.equalTo(8)
            make.height.equalTo(30)
            make.width.equalTo(150)
        }
    }
}
            
