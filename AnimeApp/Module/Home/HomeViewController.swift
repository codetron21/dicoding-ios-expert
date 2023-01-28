//
//  ViewController.swift
//  AnimeApp
//
//  Created by Irsyad Purbha on 27/01/23.
//

import UIKit

protocol HomeView: AnyObject {
    func viewDidLoad()
    func onItemDidPressed(indexPath: Int)
}

class HomeViewController: UIViewController {

    private let tableAnime: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private let loadingLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    private func setupView() {
        view.backgroundColor = .systemCyan
        view.addSubview(tableAnime)
        view.addSubview(loadingLabel)
        
        setupTable()
        setupLoading()
    }
    
    private func setupLoading() {
        let constraint = [
            loadingLabel.centerXAnchor.constraint(equalTo: tableAnime.centerXAnchor),
            loadingLabel.centerYAnchor.constraint(equalTo: tableAnime.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(constraint)
    }
    
    private func setupTable() {
        tableAnime.backgroundColor = UIColor.white
        tableAnime.register(UITableViewCell.self, forCellReuseIdentifier: "id")
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

}

extension HomeViewController: HomeView {
    
    func onItemDidPressed(indexPath: Int) {
        print(indexPath)
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    
}
