//
//  ListFilmsViewController.swift
//  ListarFilmesMVC
//
//  Created by William Moreira on 26/04/23.
//

import UIKit

class ListFilmsViewController: UIViewController, ListFilmViewDelegate {
    
    var filmView = ListFilmView()
    var film: Result = Result(adult: false,
                              backdropPath: ProjectStrings.stringEmpty.localized,
                              genreIDS: [0],
                              id: 0,
                              originalLanguage: ProjectStrings.stringEmpty.localized,
                              originalTitle: ProjectStrings.stringEmpty.localized,
                              overview: ProjectStrings.stringEmpty.localized,
                              popularity: 0.0,
                              posterPath: ProjectStrings.stringEmpty.localized,
                              releaseDate: ProjectStrings.stringEmpty.localized,
                              title: ProjectStrings.stringEmpty.localized,
                              video: false,
                              voteAverage: 0.0,
                              voteCount: 0)

    override func loadView() {
        super.loadView()
        view = filmView
        filmView.delegate = self
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func goToDetailViewController(filmSelected: Result) {
        let detailVC = DetailFilmViewController()
        detailVC.film = filmSelected
        let backButton = UIBarButtonItem(title: ProjectStrings.back.localized, style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
