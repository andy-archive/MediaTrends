//
//  MainCollectionViewCell.swift
//  MediaTrends
//
//  Created by Taekwon Lee on 2023/08/14.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet private weak var genreLabel: UILabel!
    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var voteAverageLabel: UILabel!
    @IBOutlet private weak var movieTitleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
