//
//  DetailViewController.swift
//  MediaTrends
//
//  Created by Taekwon Lee on 2023/08/22.
//

import UIKit
import Kingfisher

final class DetailViewController: UIViewController {
    
    var movie: Movie?
    
    @IBOutlet private weak var detailTableView: UITableView! {
        didSet {
            detailTableView.delegate = self
            detailTableView.dataSource = self
        }
    }
    @IBOutlet private weak var backImageView: UIImageView!
    @IBOutlet private weak var movieTitleLabel: UILabel! {
        didSet {
            movieTitleLabel.font = UIFont.boldSystemFont(ofSize: 25)
            movieTitleLabel.text = movie?.title
            movieTitleLabel.textColor = .white
        }
    }
    @IBOutlet private weak var posterImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        callRequest()
        fetchImages()
    }
    
    private func fetchImages() {
        guard let backdropPath = movie?.backdropPath else { return }
        let backImageURL = URL.imageURL + backdropPath
        backImageView.kf.setImage(with: URL(string:backImageURL))
        
        guard let posterPath = movie?.posterPath else { return }
        let posterImageURL = URL.imageURL + posterPath
        posterImageView.kf.setImage(with: URL(string: posterImageURL))
    }
    
    private func callRequest() {
        guard let movieId = movie?.id else { return }

//        MovieAPIManager.shared.getMovieCredit(type: .credit, movieId: movieId) { data in
//            print("JSON: \(data)")
//        }
    }
    
    private func configureNavigationBar() {
        self.title = "출연/제작"
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
    }
}

// MARK: DetailTableView

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as? DetailTableViewCell else { return UITableViewCell() }
        
        return cell
    }
}
