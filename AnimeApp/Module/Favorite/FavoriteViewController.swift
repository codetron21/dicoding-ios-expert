//
//  FavoriteViewController.swift
//  AnimeApp
//
//  Created by Apple on 29/01/23.
//

import Foundation
import UIKit

protocol FavoriteViewProtocol: AnyObject {
    
}

class FavoriteViewController: UIViewController {
    
    private let tableAnime: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private let loadingLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.isHidden = true
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.systemRed
        label.text = "Empty animes"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.isHidden = true
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setupView() {
        view.backgroundColor = .systemCyan
        
        title = "Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupTable()
        setupLoading()
        setupErrorLabel()
    }
    
    private func setupLoading() {
        view.addSubview(loadingLabel)
        
        let constraint = [
            loadingLabel.centerXAnchor.constraint(equalTo: tableAnime.centerXAnchor),
            loadingLabel.centerYAnchor.constraint(equalTo: tableAnime.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(constraint)
    }
    
    private func setupTable() {
        view.addSubview(tableAnime)
        
        tableAnime.backgroundColor = UIColor.white
        tableAnime.register(AnimeItemCell.self, forCellReuseIdentifier: AnimeItemCell.id)
        tableAnime.rowHeight = AnimeItemCell.rowHeight
        tableAnime.delegate = self
        tableAnime.dataSource = self
        
        let safeGuide = view.safeAreaLayoutGuide
        
        let constraint = [
            tableAnime.topAnchor.constraint(equalTo: safeGuide.topAnchor),
            tableAnime.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableAnime.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraint)
    }
    
    private func setupErrorLabel() {
        view.addSubview(errorLabel)
        
        let constraint = [
            errorLabel.centerXAnchor.constraint(equalTo: tableAnime.centerXAnchor),
            errorLabel.centerYAnchor.constraint(equalTo: tableAnime.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(constraint)
    }
    
}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AnimeItemCell.id, for: indexPath) as? AnimeItemCell else { return UITableViewCell() }
        return cell
    }
    
}
