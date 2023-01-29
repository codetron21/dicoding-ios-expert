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
    
    private func setupView() {
        
    }
    
}
