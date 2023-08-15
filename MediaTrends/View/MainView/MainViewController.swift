//
//  MainViewController.swift
//  MediaTrends
//
//  Created by Taekwon Lee on 2023/08/14.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
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
        
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as? MainCollectionViewCell else { return UICollectionViewCell() }
        
        let row = Movie.list[indexPath.row]
    }

}
// MARK: NavigationBar

extension MainViewController {
    
    func configureNavigationBar() {
        let listImage = UIImage(systemName: "list.triangle")
        let searchImage = UIImage(systemName: "magnifyingglass")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: listImage, style: .plain, target: self, action: #selector(listButtonClicked))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(searchButtonClicked))
    }
    
}
