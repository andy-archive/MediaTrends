//
//  TrendCollectionViewCell.swift
//  MediaTrends
//
//  Created by Taekwon Lee on 2023/08/28.
//

import UIKit

final class TrendCollectionViewCell: BaseCollectionViewCell {
    
    private let backView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        return view
    }()
    
    private let imageView = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    private let titleLabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let overviewLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .gray
        label.numberOfLines = 3
        return label
    }()
    
    private let dividerView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private let detailLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .black
        return label
    }()
    
    private let rightChevronView = {
        let image = UIImage(systemName: "chevron.right")
        let view = UIImageView(image: image)
        view.tintColor = .blue
        return view
    }()
    
    override func configureView() {
        contentView.layer.shadowColor = UIColor.label.cgColor
        contentView.layer.shadowOffset = CGSize(width: 1, height: 1)
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowRadius = 12
        contentView.layer.masksToBounds = false
        
        contentView.addSubview(backView)
        backView.addSubview(imageView)
        backView.addSubview(titleLabel)
        backView.addSubview(overviewLabel)
        backView.addSubview(dividerView)
        backView.addSubview(detailLabel)
        backView.addSubview(rightChevronView)
    }
    
    override func setConstraints() {
        backView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        imageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalTo(backView.snp.width).multipliedBy(9.0 / 16.0)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(backView).inset(16)
        }
        overviewLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.horizontalEdges.equalTo(backView).inset(16)
        }
        dividerView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.horizontalEdges.equalTo(backView).inset(16)
            make.top.equalTo(overviewLabel.snp.bottom).offset(16)
        }
        detailLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(12)
        }
        rightChevronView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(12)
        }
    }
    
    func configureCell(row: Movie) {
        let imageURL = URL.imageURL + row.posterPath
        if let imageURL = URL(string: imageURL) {
            imageView.kf.setImage(with: imageURL)
        }
        titleLabel.text = row.originalTitle
        overviewLabel.text = row.overview
        detailLabel.text = "자세히 보기"
    }
}
