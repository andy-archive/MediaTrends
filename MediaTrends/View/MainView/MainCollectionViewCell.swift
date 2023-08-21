//
//  MainCollectionViewCell.swift
//  MediaTrends
//
//  Created by Taekwon Lee on 2023/08/14.
//

import UIKit
import Kingfisher

class MainCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var backView: UIView! {
        didSet {
            backView.layer.cornerRadius = 10
            backView.layer.masksToBounds = true
        }
    }
    
    @IBOutlet private weak var movieImageView: UIImageView! {
        didSet {
            movieImageView.contentMode = .scaleAspectFill
        }
    }
    
    @IBOutlet private weak var clipButton: UIButton! {
        didSet {
            let imageConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .regular)
            let image = UIImage(systemName: "paperclip", withConfiguration: imageConfig)
            clipButton.setImage(image, for: .normal)
            clipButton.backgroundColor = .white
            clipButton.tintColor = .black
            clipButton.layer.cornerRadius = 15
        }
    }
    
    @IBOutlet private weak var averageWordLabel: UILabel! {
        didSet {
            averageWordLabel.font = .systemFont(ofSize: 15)
            averageWordLabel.backgroundColor = .systemPurple
            averageWordLabel.textAlignment = .center
            averageWordLabel.textColor = .white
        }
    }
    
    @IBOutlet private weak var averageNumberLabel: UILabel! {
        didSet {
            averageNumberLabel.font = .systemFont(ofSize: 15)
            averageNumberLabel.backgroundColor = .white
            averageNumberLabel.textAlignment = .center
            averageNumberLabel.textColor = .systemPurple
        }
    }
    
    @IBOutlet private weak var movieTitleLabel: UILabel! {
        didSet {
            movieTitleLabel.font = .boldSystemFont(ofSize: 19)
        }
    }
    
    @IBOutlet private weak var overviewLabel: UILabel! {
        didSet {
            overviewLabel.font = .systemFont(ofSize: 15)
            overviewLabel.textColor = .darkGray
            overviewLabel.numberOfLines = 3
            overviewLabel.textAlignment = .natural
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor.label.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 12
        layer.masksToBounds = false
    }
    
    func configureCell(row: Movie) {
        let imageURL = URL.imageURL + row.posterPath
        if let imageURL = URL(string: imageURL) {
            movieImageView.kf.setImage(with: imageURL)
        }
        
        averageNumberLabel.text = String(format: "%.1f", row.voteAverage)
        movieTitleLabel.text = row.originalTitle
        overviewLabel.text = row.overview
    }

}
