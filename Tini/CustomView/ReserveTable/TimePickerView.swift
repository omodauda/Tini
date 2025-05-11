//
//  TimePickerView.swift
//  Tini
//
//  Created by Omodauda on 11/05/2025.
//

import UIKit

class TimePickerView: UIView {
    var onTimeSelected: ((String) -> Void)?
    var selectedTime: String?
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Time"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(hex: Colors.titleText)
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8
        layout.itemSize = CGSize(width: 90, height: 32)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(TimePickerCell.self, forCellWithReuseIdentifier: TimePickerCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .clear
        addSubview(label)
        addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 4),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func generateTimestamps() -> [String] {
        var timestamps: [String] = []
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        let calendar = Calendar.current
        var date = calendar.date(bySettingHour: 8, minute: 0, second: 0, of: Date())!
        let endDate = calendar.date(bySettingHour: 20, minute: 0, second: 0, of: Date())!
        
        while date <= endDate {
            timestamps.append(dateFormatter.string(from: date))
            date = calendar.date(byAdding: .minute, value: 30, to: date)!
        }
        
        return timestamps
    }
    
    func updateSelectedTime(with time: String) {
        selectedTime = time
        collectionView.reloadData()
        onTimeSelected?(time)
    }
    
}

extension TimePickerView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return generateTimestamps().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimePickerCell.identifier, for: indexPath) as? TimePickerCell else {
            return UICollectionViewCell()
        }
        let timestamp = generateTimestamps()[indexPath.row]
        let isSelected = selectedTime == timestamp
        cell.configure(with: timestamp, isSelected: isSelected)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let timestamp = generateTimestamps()[indexPath.row]
        updateSelectedTime(with: timestamp)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}
