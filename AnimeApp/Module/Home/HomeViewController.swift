//
//  ViewController.swift
//  AnimeApp
//
//  Created by Irsyad Purbha on 27/01/23.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
    }

    private func setupView() {
        view.backgroundColor = .systemCyan
        title = "Home"
    }

}

