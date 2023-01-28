//
//  ViewController.swift
//  AnimeApp
//
//  Created by Irsyad Purbha on 27/01/23.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func onLoading()
    func onFetchDataSuccess()
    func onFetchDataFailure()
}

class HomeViewController: UIViewController {

    private lazy var presenter: HomePresenterProtocol = {
        return Injection.shared.provideHomePresenter(with: self)
    }()
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
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

extension HomeViewController: HomeViewProtocol {
    func onLoading() {
        print("DEBUG: home view loading")
    }
    
    func onFetchDataSuccess() {
        print("DEBUG: home view success")
    }
    
    func onFetchDataFailure() {
        print("DEBUG: home view error")
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
