//
//  TrendViewController.swift
//  MediaTrends
//
//  Created by Taekwon Lee on 2023/08/28.
//

import UIKit

final class TrendViewController: BaseViewController {

    let mainView = TrendView()
    
    var movieList = [Movie]() {
        didSet {
            mainView.collectionView.reloadData()
        }
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callRequest()
    }
    
    override func configureView() {
        super.configureView()
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
    }
}

// MARK: Network

extension TrendViewController {
    private func callRequest() {
        MovieAPIManager.shared.getTrendingMovies(type: .trendingDay) { data in
            self.movieList = data.results
        }
    }
}

// MARK: TrendCollectionView

extension TrendViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrendCollectionViewCell.identifier, for: indexPath) as? TrendCollectionViewCell else { return UICollectionViewCell() }
        let row = movieList[indexPath.row]
        
        cell.configureCell(row: row)
        
        return cell
    }
    
    
}