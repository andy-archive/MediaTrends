//
//  MainViewController.swift
//  MediaTrends
//
//  Created by Taekwon Lee on 2023/08/14.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet private weak var movieCollectionView: UICollectionView! {
        didSet {
            movieCollectionView.delegate = self
            movieCollectionView.dataSource = self
        }
    }
    
    private var movieList = [Result]() {
        didSet {
            movieCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        configureNavigationBar()

        callRequest()
    }
    
    func callRequest() {
        MovieAPIManager.shared.getTrendingMovies(type: .trendingDay) { data in
            guard let results = data.results else { return }
            
            self.movieList = results
            print("JSON: \(data)")
        }
    }
    
    @objc func listButtonClicked(_sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: ListViewController.identifier) as? ListViewController else { return }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func searchButtonClicked(_sender: UIButton) {
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
        
        return cell
    }

}
// MARK: NavigationBar

extension MainViewController {
    
    func configureNavigationBar() {
        let navigationBar = UINavigationBar()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(navigationBar)
        
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
