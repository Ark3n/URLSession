//
//  ViewController.swift
//  URLSessionExample
//
//  Created by Arken Sarsenov on 13.12.2023.
//

import UIKit

class ViewController: UIViewController {
    let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        mainView.delegate = self
        view.backgroundColor = .systemBackground
    }
}

// MARK: - MainView Delegare

extension ViewController: MainViewDelegate {
    func buttonTapped() {
        // create URL
        guard let url = URL(string: Model.api) else { fatalError("url is nill")}
        // init session
        let session = URLSession(configuration: .default)
        // create dataTask
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.mainView.configureUI(data: data)
            }
        }
        task.resume()
    }
}
