//
//  MainView.swift
//  URLSessionExample
//
//  Created by Arken Sarsenov on 13.12.2023.
//

import UIKit
protocol MainViewDelegate: AnyObject {
    func buttonTapped()
}
class MainView: UIView {
    // MARK: - Properties
    weak var delegate: MainViewDelegate?
    private lazy var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .systemGray6.withAlphaComponent(0.7)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var getImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get Image", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    // MARK: - View lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    private func setupView() {
        addSubview(imageView)
        addSubview(getImageButton)
        imageView.layer.cornerRadius = 20
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 8),
            imageView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 4),
            trailingAnchor.constraint(equalToSystemSpacingAfter: imageView.trailingAnchor, multiplier: 4),
            safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: getImageButton.bottomAnchor, multiplier: 4),
            getImageButton.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 4),
            trailingAnchor.constraint(equalToSystemSpacingAfter: getImageButton.trailingAnchor, multiplier: 4),
            getImageButton.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier:  4),
            getImageButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func buttonTapped() {
        delegate?.buttonTapped()
    }
    
    public func configureUI(data: Data) {
        imageView.image = UIImage(data: data)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
