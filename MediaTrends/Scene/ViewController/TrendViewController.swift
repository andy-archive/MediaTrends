//
//  TrendViewController.swift
//  MediaTrends
//
//  Created by Taekwon Lee on 2023/08/28.
//

import UIKit

final class TrendViewController: BaseViewController {

    private let mainView = TrendView()
    
    var movieList = [Movie]()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        callRequest()
    }
    
    override func configureView() {
        super.configureView()
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
    }
    
    @objc
    func profileButtonClicked() {
        let vc = ProfileViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: Network

extension TrendViewController {
    private func callRequest() {
        
        MovieAPIManager.shared.getTrendingMovies(type: .trendingDay) { movie in
            
            guard let movie = movie else {
                print("ERROR")
                return
            }
            
            self.movieList = movie.results
            self.mainView.collectionView.reloadData()
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

// MARK: NavigationBar

extension TrendViewController {
    private func configureNavigationBar() {
        let profileImage = UIImage(systemName: "person.circle")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: profileImage,
            style: .plain,
            target: self,
            action: #selector(profileButtonClicked)
        )
    }
}
