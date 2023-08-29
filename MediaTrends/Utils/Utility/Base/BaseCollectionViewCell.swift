//
//  BaseCollectionViewCell.swift
//  MediaTrends
//
//  Created by Taekwon Lee on 2023/08/28.
//

import UIKit
import Kingfisher

class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {}
    
    func setConstraints() {}
}
