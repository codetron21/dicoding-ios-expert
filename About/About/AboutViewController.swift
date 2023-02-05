//
//  AboutViewController.swift
//  AnimeApp
//
//  Created by Apple on 29/01/23.
//

import UIKit

class AboutViewController: UIViewController {
    
    private let photoImage: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(named: "ada_photo")
            image.contentMode = .scaleAspectFit
            image.translatesAutoresizingMaskIntoConstraints = false
            return image
        }()
        
        private let nameLabel: UILabel = {
            let label = UILabel()
            label.text = "Adadua karunia putera"
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 20)
            return label
        }()
        
        private let emailLabel: UILabel = {
            let label = UILabel()
            label.text = "adasoraninda@gmail.com"
            label.textAlignment = .center
            label.font = UIFont.italicSystemFont(ofSize: 14)
            return label
        }()
        
        private let stackView: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.alignment = .center
            stack.spacing = 10
            stack.translatesAutoresizingMaskIntoConstraints = false
            return stack
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemCyan
        
        title = "About"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupStack()
        setupPhoto()
    }
    
    private func setupStack() {
        stackView.addArrangedSubview(photoImage)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(emailLabel)
        
        view.addSubview(stackView)
        
        let constraint = [
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(constraint)
    }
    
    private func setupPhoto() {
        let imageSize: CGFloat = 120
        
        photoImage.layer.borderColor = UIColor.white.cgColor
        photoImage.layer.borderWidth = 2
        photoImage.layer.cornerRadius = imageSize / 2
        photoImage.layer.masksToBounds = false
        photoImage.clipsToBounds = true
        
        let constraint = [
            photoImage.widthAnchor.constraint(equalToConstant: imageSize),
            photoImage.heightAnchor.constraint(equalToConstant: imageSize)
        ]
        
        NSLayoutConstraint.activate(constraint)
    }
    
}
