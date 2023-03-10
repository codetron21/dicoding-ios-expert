//
//  ViewController.swift
//  AnimeApp
//
//  Created by Irsyad Purbha on 27/01/23.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func onLoadingState()
    func onBindSuccessState(data: [ItemAnimeModel])
    func onBindFailureState(message: String)
}

class HomeViewController: UIViewController {
    
    private lazy var presenter: HomePresenterProtocol = {
        let appRouter = Injection.shared.provideAppRouter(with: self)
        return Injection.shared.provideHomePresenter(
            with: self,
            appRouter: appRouter)
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
        label.isHidden = true
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.systemRed
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
        presenter.viewWillAppear()
    }
    
    private func setupView() {
        view.backgroundColor = .systemCyan
        
        title = "Home"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let aboutItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(actionAboutDidPressed))
        let favoriteItem = UIBarButtonItem(image: UIImage(systemName: "heart.circle"), style: .plain, target: self, action: #selector(actionFavoriteDidPressed))
        
        navigationItem.rightBarButtonItems = [
            aboutItem,
            favoriteItem
        ]
        
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

extension HomeViewController: HomeViewProtocol {
    func onLoadingState() {
        print("DEBUG: home view loading")
        loadingLabel.isHidden = false
        errorLabel.isHidden = true
    }
    
    func onBindSuccessState(data: [ItemAnimeModel]) {
        print("DEBUG: home view success")
        loadingLabel.isHidden = true
        errorLabel.isHidden = true
        tableAnime.reloadData()
    }
    
    func onBindFailureState(message: String) {
        print("DEBUG: home view error")
        loadingLabel.isHidden = true
        errorLabel.isHidden = false
        errorLabel.text = "Error occurred with message:\n\(message)"
    }
    
}

extension HomeViewController {
    
    @objc func actionAboutDidPressed() {
        presenter.onAboutDidPressed()
    }
    
    @objc func actionFavoriteDidPressed() {
        presenter.onFavoriteDidPressed()
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.onItemDidSelected(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AnimeItemCell.id, for: indexPath) as? AnimeItemCell else { return UITableViewCell() }
        cell.anime = presenter.data[indexPath.row]
        return cell
    }
    
    
}
