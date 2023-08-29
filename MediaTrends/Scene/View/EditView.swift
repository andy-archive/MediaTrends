//
//  EditView.swift
//  MediaTrends
//
//  Created by Taekwon Lee on 2023/08/29.
//

import UIKit

final class EditView: BaseView {
    
    private let profileBackView = {
        let view = UIView()
        view.backgroundColor = .systemOrange
        return view
    }()
    
    private let profileInfoBackView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()
    
    let nameInfoButton = {
        let view = UIButton()
        view.backgroundColor = .systemRed
        view.setTitle("이름", for: .normal)
        view.setTitleColor(.white, for: .normal)
        return view
    }()
    
    let usernameInfoButton = {
        let view = UIButton()
        view.backgroundColor = .systemGreen
        view.setTitle("사용자 이름", for: .normal)
        view.setTitleColor(.white, for: .normal)
        return view
    }()
    
    let bioButton = {
        let view = UIButton()
        view.backgroundColor = .systemBlue
        view.setTitle("소개", for: .normal)
        view.setTitleColor(.white, for: .normal)
        return view
    }()
    
    override func configureView() {
        super.configureView()
        
        addSubview(profileBackView)
        addSubview(profileInfoBackView)
        profileInfoBackView.addSubview(nameInfoButton)
        profileInfoBackView.addSubview(usernameInfoButton)
        profileInfoBackView.addSubview(bioButton)
    }
    
    override func setConstraints() {
        profileBackView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(100)
        }
        
        profileInfoBackView.snp.makeConstraints { make in
            make.top.equalTo(profileBackView.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(300)
        }
        
        nameInfoButton.snp.makeConstraints { make in
            make.top.equalTo(profileInfoBackView.snp.top).inset(20)
            make.horizontalEdges.equalToSuperview().inset(40)
            make.height.equalTo(30)
        }
        
        usernameInfoButton.snp.makeConstraints { make in
            make.top.equalTo(nameInfoButton.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(40)
            make.height.equalTo(30)
        }
        
        bioButton.snp.makeConstraints { make in
            make.top.equalTo(usernameInfoButton.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(40)
            make.height.equalTo(30)
        }
    }
}
