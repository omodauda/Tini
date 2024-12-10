//
//  HomeVC.swift
//  Tini
//
//  Created by Omodauda on 29/11/2024.
//

import UIKit

class HomeVC: UIViewController {
    
    private let headerView = HomeHeader()
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
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.register(PromotionItemCollectionViewCell.self, forCellWithReuseIdentifier: PromotionItemCollectionViewCell.identifier)
        collectionView.register(HomeCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeCollectionViewHeader.reuseIdentifier)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 120, right: 0)
    }
    
    private func setupUI() {
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            headerView.heightAnchor.constraint(equalToConstant: 56),
            
            collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 24),
            collectionView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            collectionView.heightAnchor.constraint(equalToConstant: 800)
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeCollectionViewHeader.reuseIdentifier, for: indexPath) as! HomeCollectionViewHeader
            return header
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 545)
    }
}
