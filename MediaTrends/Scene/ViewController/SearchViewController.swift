//
//  SearchViewController.swift
//  MediaTrends
//
//  Created by Taekwon Lee on 2023/08/15.
//

import UIKit

final class SearchViewController: BaseViewController {
    
    private let titleLabel = {
        let view = UILabel()
        view.text = "검색 화면"
        view.font = .boldSystemFont(ofSize: 30)
        view.textColor = .black
        view.numberOfLines = 1
        return view
    }()
    
    private let searchBar = {
        let view = UISearchBar()
        view.placeholder = "영화를 검색하세요"
        return view
    }()
    
    override func configureView() {
        super.configureView()
        
        configureNavigationBar()
        
        tabBarController?.tabBar.isHidden = true
    }
    
    override func setConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc
    func backButtonClicked() {
        tabBarController?.tabBar.isHidden = false
        navigationController?.popViewController(animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func configureNavigationBar() {
        let backButton = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left"),
            style: .plain,
            target: self,
            action: #selector(backButtonClicked)
        )
        
        navigationItem.titleView = searchBar
        navigationItem.setLeftBarButton(backButton, animated: true)
        
//        navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target: nil, action: nil)
        
        view.addSubview(titleLabel)
    }
}
