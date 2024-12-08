//
//  HomeVC.swift
//  Tini
//
//  Created by Omodauda on 29/11/2024.
//

import UIKit

class HomeVC: UIViewController {
    
    private let headerView = HomeHeader()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private let deliveryCard = DeliveryCard()
    private let reservationCard = ReservationCard()
    
    private var collectionView: UICollectionView!
    
    private let promoItemsViewModel = PromotionItemsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(hex: Colors.background)
        configureCollectionView()
        setupUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        collectionView = UICollectionView(frame: contentView.bounds, collectionViewLayout: layout)
        collectionView.register(PromotionItemCollectionViewCell.self, forCellWithReuseIdentifier: PromotionItemCollectionViewCell.identifier)
    }
    
    private func setupUI() {
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.pinToEdges(of: scrollView)
        
        contentView.addSubview(deliveryCard)
        deliveryCard.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(reservationCard)
        reservationCard.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            headerView.heightAnchor.constraint(equalToConstant: 56),
            
            scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            
            deliveryCard.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            deliveryCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            deliveryCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            deliveryCard.heightAnchor.constraint(equalToConstant: 154),
            
            reservationCard.topAnchor.constraint(equalTo: deliveryCard.bottomAnchor, constant: 16),
            reservationCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            reservationCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            reservationCard.heightAnchor.constraint(equalToConstant: 154),
            
            collectionView.topAnchor.constraint(equalTo: reservationCard.bottomAnchor, constant: 24),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            collectionView.heightAnchor.constraint(equalToConstant: 600)
        ])
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return promoItemsViewModel.promotionItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromotionItemCollectionViewCell.identifier, for: indexPath) as? PromotionItemCollectionViewCell else { return UICollectionViewCell() }
        let item = promoItemsViewModel.promotionItems[indexPath.row]
        cell.set(item: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Get the contentView width dynamically
        let contentViewWidth = collectionView.bounds.width
        
        // Calculate the item width based on contentView width, and the number of items per row
        let padding: CGFloat = 16 // Padding for spacing
        let availableWidth = contentViewWidth - padding // Subtract total spacing from contentView width
        
        let itemsPerRow: CGFloat = 2 // Number of items per row
        let itemWidth = availableWidth / itemsPerRow // Calculate width for each item
        
        return CGSize(width: itemWidth, height: 228) // Adjust height as needed
    }
}
