//
//  StoreCard.swift
//  Tini
//
//  Created by Omodauda on 03/01/2025.
//

import UIKit

protocol StoreCardDelegate: AnyObject {
    func didTapFavBtn()
}

class StoreCard: UIView {

    weak var delegate: StoreCardDelegate?
    
    private let imagePlaceholder: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.masksToBounds = true
        return view
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.storeImage
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = UIColor(hex: Colors.titleText)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let workingHoursLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = UIColor(hex: Colors.titleText)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let favBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(store: StoreModel) {
        super.init(frame: .zero)
        setupUI()
        configure(with: store)
        configureFavBtn()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(with store: StoreModel) {
        nameLabel.text = store.name
        workingHoursLabel.text = store.workingHours
        
        if store.isFavorite {
            favBtn.setImage(Images.favIcon, for: .normal)
        } else {
            favBtn.setImage(Images.favOutlineIcon, for: .normal)
            favBtn.tintColor = UIColor(hex: Colors.secondary)
        }
    }
    
    private func configureFavBtn() {
        favBtn.addTarget(self, action: #selector(didTapFavBtn), for: .touchUpInside)
    }
    
    @objc private func didTapFavBtn() {
        delegate?.didTapFavBtn()
    }
    
    private func setupUI() {
        layer.cornerRadius = 8
        backgroundColor = .white
        
        addSubview(imagePlaceholder)
        addSubview(nameLabel)
        addSubview(workingHoursLabel)
        addSubview(favBtn)
        
        imagePlaceholder.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imagePlaceholder.topAnchor.constraint(equalTo: topAnchor),
            imagePlaceholder.leadingAnchor.constraint(equalTo: leadingAnchor),
            imagePlaceholder.trailingAnchor.constraint(equalTo: trailingAnchor),
            imagePlaceholder.heightAnchor.constraint(equalToConstant: 400),
            
            imageView.topAnchor.constraint(equalTo: imagePlaceholder.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: imagePlaceholder.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: imagePlaceholder.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: imagePlaceholder.bottomAnchor),
            
            favBtn.topAnchor.constraint(equalTo: imagePlaceholder.bottomAnchor, constant: 12),
            favBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            favBtn.widthAnchor.constraint(equalToConstant: 24),
            favBtn.heightAnchor.constraint(equalToConstant: 24),
            
            nameLabel.topAnchor.constraint(equalTo: imagePlaceholder.bottomAnchor, constant: 12),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: favBtn.leadingAnchor, constant: -18),
            
            workingHoursLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
            workingHoursLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            workingHoursLabel.trailingAnchor.constraint(equalTo: favBtn.leadingAnchor, constant: -18),
            workingHoursLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
    }

}
