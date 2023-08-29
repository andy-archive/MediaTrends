//
//  MainViewController.swift
//  MediaTrends
//
//  Created by Taekwon Lee on 2023/08/14.
//

import UIKit
import Kingfisher

final class MainViewController: UIViewController {
    
    @IBOutlet private weak var movieCollectionView: UICollectionView! {
        didSet {
            movieCollectionView.delegate = self
            movieCollectionView.dataSource = self
            let nib = UINib(nibName: MainCollectionViewCell.identifier, bundle: nil)
            movieCollectionView.register(nib, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        }
    }
    
    private var movieList = [Movie]() {
        didSet {
            movieCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureCollectionViewLayout()
        callRequest()
    }
    
    private func configureCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width
        
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 50
        layout.itemSize = CGSize(width: width, height: width)
        movieCollectionView.collectionViewLayout = layout
    }
    
    private func callRequest() {
        MovieAPIManager.shared.getTrendingMovies(type: .trendingDay) { data in
            self.movieList = data.results
        }
    }
    
    @objc
    func detailButtonClicked(_sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: DetailViewController.identifier) as? DetailViewController else { return }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func listButtonClicked(_sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: ListViewController.identifier) as? ListViewController else { return }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func searchButtonClicked(_sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: SearchViewController.identifier) as? SearchViewController else { return }
        
        navigationController?.pushViewController(vc, animated: true)
    }

}

// MARK: MainCollectionView

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as? MainCollectionViewCell else { return UICollectionViewCell() }
        let row = movieList[indexPath.row]
        
        cell.configureCell(row: row)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: DetailViewController.identifier) as? DetailViewController else { return }
        let row = movieList[indexPath.row]
        
        vc.movie = row
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: NavigationBar

extension MainViewController {
    
    func configureNavigationBar() {
        let navigationBar = UINavigationBar()
        self.view.addSubview(navigationBar)
        
        navigationBar.translatesAutoresizingMaskIntoConstraints = false

        let safeArea = self.view.safeAreaLayoutGuide
        navigationBar.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        navigationBar.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        navigationBar.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        
        let listImage = UIImage(systemName: "list.triangle")
        let searchImage = UIImage(systemName: "magnifyingglass")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: listImage, style: .plain, target: self, action: #selector(listButtonClicked))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(searchButtonClicked))
    }
    
}
