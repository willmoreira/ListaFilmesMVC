//
//  DetailFilmViewController.swift
//  ListarFilmesMVC
//
//  Created by William Moreira on 28/04/23.
//

import UIKit

class DetailFilmViewController: UIViewController {
    
    var film: Result?
    var customImageView: UIImageView = {
        let myImg = UIImageView()
        myImg.contentMode = .scaleAspectFit
        return myImg
    }()
    
    var titleView: UILabel = {
        let titleView = UILabel()
        titleView.font = UIFont.systemFont(ofSize: 24)
        titleView.textAlignment = .center
        titleView.numberOfLines = 2
        return titleView
    }()
    
    var descriptLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        
        if let img = film?.posterPath {
            configureImage(posterPath: img)
        }
        
        view.backgroundColor = .white
        titleView.text = film?.title
        descriptLabel.text = film?.overview
        titleView.translatesAutoresizingMaskIntoConstraints = false
        customImageView.translatesAutoresizingMaskIntoConstraints = false
        descriptLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(titleView)
        view.addSubview(customImageView)
        view.addSubview(descriptLabel)
        
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            titleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            customImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customImageView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 16),
            customImageView.widthAnchor.constraint(equalToConstant: 350),
            customImageView.heightAnchor.constraint(equalToConstant: 350),
            
            descriptLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            descriptLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            descriptLabel.topAnchor.constraint(equalTo: customImageView.bottomAnchor, constant: 16),
        ])
    }
   
    func configureImage(posterPath: String) {
        let imageUrl = URL(string: ProjectStrings.urlSdWebImage.localized + posterPath)
        customImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: ProjectStrings.placeholder.localized))
    }
}



