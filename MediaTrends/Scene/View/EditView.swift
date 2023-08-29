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
    
    override func configureView() {
        super.configureView()
        
        addSubview(profileBackView)
        addSubview(profileInfoBackView)
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
    }
}
