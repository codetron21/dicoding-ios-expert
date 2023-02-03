//
//  DetailViewController.swift
//  AnimeApp
//
//  Created by Apple on 29/01/23.
//

import Foundation
import UIKit

protocol DetailViewProtocol: AnyObject {
    func onLoadingState()
    func onBindSuccessState(data: DetailAnimeModel)
    func onBindFailureState(message: String)
    func onFavoriteState(isFavorite: Bool)
}

class DetailViewController: UIViewController {
    
    var id: Int?
    
    private lazy var presenter: DetailPresenterProtocol = {
        return Injection.shared.provideDetailPresenter(with: self)
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
    
    private let posterImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .white
        image.isHidden = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.sizeToFit()
        label.lineBreakMode = .byTruncatingTail
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Descriptions"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionValueLabel: UITextView = {
        let textView = UITextView()
        textView.sizeToFit()
        textView.textAlignment = .justified
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let stackTitle: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.backgroundColor = .white
        stack.spacing = 4
        stack.isHidden = true
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let stackDescription: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.backgroundColor = .white
        stack.spacing = 10
        stack.isHidden = true
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear(with: id)
    }
    
    private func setupView() {
        view.backgroundColor = .systemCyan
        
        setupImage()
        setupTitleStack()
        setupDescriptionStack()
    }
    
    private func setupTitleStack() {
        view.addSubview(stackTitle)
        
        stackTitle.addArrangedSubview(titleLabel)
        stackTitle.addArrangedSubview(infoLabel)
        
        let stackConstraint = [
            stackTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackTitle.topAnchor.constraint(equalToSystemSpacingBelow: posterImage.bottomAnchor, multiplier: 1)
        ]
        
        let titleConstraint = [
            titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: stackTitle.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: stackTitle.trailingAnchor, constant: -10)
        ]
        
        let infoLabel = [
            infoLabel.leadingAnchor.constraint(greaterThanOrEqualTo: stackTitle.leadingAnchor, constant: 10),
            infoLabel.trailingAnchor.constraint(lessThanOrEqualTo: stackTitle.trailingAnchor, constant: -10)
        ]
        
        NSLayoutConstraint.activate(stackConstraint)
        NSLayoutConstraint.activate(titleConstraint)
        NSLayoutConstraint.activate(infoLabel)
        
    }
    
    private func setupDescriptionStack() {
        view.addSubview(stackDescription)
        
        stackDescription.addArrangedSubview(descriptionLabel)
        stackDescription.addArrangedSubview(descriptionValueLabel)
        
        let stackConstraint = [
            stackDescription.widthAnchor.constraint(equalTo: view.widthAnchor),
            stackDescription.topAnchor.constraint(equalToSystemSpacingBelow: stackTitle.bottomAnchor, multiplier: 1),
            stackDescription.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]

        let descConstraint = [
            descriptionLabel.leadingAnchor.constraint(greaterThanOrEqualTo: stackDescription.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(lessThanOrEqualTo: stackDescription.trailingAnchor, constant: -10)
        ]
        
        let descValConstraint = [
            descriptionValueLabel.leadingAnchor.constraint(greaterThanOrEqualTo: stackDescription.leadingAnchor, constant: 10),
            descriptionValueLabel.trailingAnchor.constraint(lessThanOrEqualTo: stackDescription.trailingAnchor, constant: -10)
        ]
        
        NSLayoutConstraint.activate(stackConstraint)
        NSLayoutConstraint.activate(descConstraint)
        NSLayoutConstraint.activate(descValConstraint)
    }
    
    private func setupImage() {
        view.addSubview(posterImage)
        
        let constraint = [
            posterImage.topAnchor.constraint(equalTo: view.topAnchor),
            posterImage.heightAnchor.constraint(equalToConstant: 320),
            posterImage.widthAnchor.constraint(equalTo: view.widthAnchor)
        ]
        
        NSLayoutConstraint.activate(constraint)
    }
    
    private func configureView(data: DetailAnimeModel) {
        posterImage.sd_setImage(with: URL(string: data.imageUrl))
        titleLabel.text = data.title
        infoLabel.text = "\(data.type) | \(data.episodes) eps | \(data.status)"
        descriptionValueLabel.text = data.description
    }
    
    private func addFavoriteView(isFavorite: Bool) {
        let favoriteItem = UIBarButtonItem(
            image: UIImage(systemName: isFavorite ? "heart.fill" : "heart"),
            style: .done,
            target: self,
            action: #selector(actionFavoriteDidPressed)
        )
        
        navigationItem.rightBarButtonItem = favoriteItem
    }
    
}

extension DetailViewController: DetailViewProtocol {
    
    func onLoadingState() {
        print("DEBUG: presenter view loading")
        loadingLabel.isHidden = false
        errorLabel.isHidden = true
        posterImage.isHidden = true
        stackTitle.isHidden = true
        stackDescription.isHidden = true
        navigationItem.rightBarButtonItem?.isHidden = true
    }
    
    func onBindSuccessState(data: DetailAnimeModel) {
        print("DEBUG: presenter view success")
        loadingLabel.isHidden = true
        errorLabel.isHidden = true
        posterImage.isHidden = false
        stackTitle.isHidden = false
        stackDescription.isHidden = false
        navigationItem.rightBarButtonItem?.isHidden = false
        
        addFavoriteView(isFavorite: data.isFavorite)
        configureView(data: data)
    }
    
    func onBindFailureState(message: String) {
        print("DEBUG: presenter view error")
        loadingLabel.isHidden = true
        errorLabel.isHidden = false
        posterImage.isHidden = true
        stackTitle.isHidden = true
        stackDescription.isHidden = true
        navigationItem.rightBarButtonItem?.isHidden = true
        
        errorLabel.text = "Error occurred with message:\n\(message)"
    }
    
    func onFavoriteState(isFavorite: Bool) {
        navigationItem.rightBarButtonItem?.image =  UIImage(systemName: isFavorite ? "heart.fill" : "heart")
    }
    
}

extension DetailViewController {
    @objc func actionFavoriteDidPressed() {
        presenter.onFavoriteDidPressed()
    }
}
