//
//  PassProfileDataView.swift
//  MediaTrends
//
//  Created by Taekwon Lee on 2023/08/30.
//

import UIKit

final class PassProfileDataView: BaseView {
    
    let textField = {
        let view = UITextField()
        view.placeholder = "입력하세요"
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.systemGray3.cgColor
        view.layer.borderWidth = 1
        view.textAlignment = .justified
        view.font = .systemFont(ofSize: 15)
        return view
    }()
    
    override func configureView() {
        super.configureView()
        addSubview(textField)
    }
    
    override func setConstraints() {
        textField.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(10)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
    }
}
