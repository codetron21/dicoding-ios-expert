//
//  AnimeItemCell.swift
//  AnimeApp
//
//  Created by Apple on 29/01/23.
//

import Foundation
import UIKit
import SDWebImage

class AnimeItemCell: UITableViewCell {
    
    static let id = "anime-cell-id"
    static let rowHeight: CGFloat = 140
    
    var anime: ItemAnimeModel? {
        didSet {
            titleLabel.text = anime?.title ?? "Unknown"
            posterImage.sd_setImage(with: URL(string: anime?.imageUrl ?? ""))
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let posterImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .systemCyan
        image.layer.cornerRadius = 8
        image.layer.masksToBounds = false
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    private func setupView() {
        setupPoster()
        setupTitle()
    }
    
    private func setupTitle() {
        contentView.addSubview(titleLabel)
        
        let constraint = [
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: posterImage.trailingAnchor, multiplier: 1),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(constraint)
    }
    
    private func setupPoster() {
        contentView.addSubview(posterImage)
        
        let constraint = [
            posterImage.widthAnchor.constraint(equalToConstant: 90),
            posterImage.heightAnchor.constraint(equalToConstant: 120),
            posterImage.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 1),
            posterImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(constraint)
    }
    
}
