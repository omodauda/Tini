//
//  NoteView.swift
//  Tini
//
//  Created by Omodauda on 12/05/2025.
//

import UIKit

class NoteView: UIView {
    
    var numberOfEderly = 0
    var numberOfChildren = 0
//    var sittingArea = "Any"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(hex: Colors.titleText)
        label.text = "Notes (optional)"
        return label
    }()
    
    private let sectionCard: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private func createDivider() -> UIView {
        let divider = UIView()
        divider.backgroundColor = UIColor(hex: Colors.tetiary)
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return divider
    }
    
    private let elderlySelection = SelectionCounterView(title: "Elderly people", subTitle: "60 years old & over", value: 0)
    
    private let childrenSelection = SelectionCounterView(title: "Children", subTitle: "3 years and under", value: 0)
    
    let sittingAreaView = SittingAreaView()
    
    let detailNoteView = DetailNoteView()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .clear
        addSubview(titleLabel)
        addSubview(sectionCard)
        
        elderlySelection.translatesAutoresizingMaskIntoConstraints = false
        elderlySelection.onDecreaseCount = { [weak self] in
            guard let self = self else { return }
            if self.numberOfEderly == 0 { return }
            
            self.numberOfEderly -= 1
            self.elderlySelection.updateValue(with: self.numberOfEderly)
        }
        elderlySelection.onIncreaseCount = { [weak self] in
            guard let self = self else { return }
            self.numberOfEderly += 1
            self.elderlySelection.updateValue(with: self.numberOfEderly)
        }
        stackView.addArrangedSubview(elderlySelection)
        stackView.addArrangedSubview(createDivider())
        
        childrenSelection.translatesAutoresizingMaskIntoConstraints = false
        childrenSelection.onDecreaseCount = { [weak self] in
            guard let self = self else { return }
            if self.numberOfChildren == 0 { return }
            
            self.numberOfChildren -= 1
            self.childrenSelection.updateValue(with: self.numberOfChildren)
        }
        childrenSelection.onIncreaseCount = { [weak self] in
            guard let self = self else { return }
            self.numberOfChildren += 1
            self.childrenSelection.updateValue(with: self.numberOfChildren)
        }
        
        stackView.addArrangedSubview(childrenSelection)
        stackView.addArrangedSubview(createDivider())
        
        sittingAreaView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(sittingAreaView)
        stackView.addArrangedSubview(createDivider())
        
        detailNoteView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(detailNoteView)
        
        
        sectionCard.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            sectionCard.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            sectionCard.leadingAnchor.constraint(equalTo: leadingAnchor),
            sectionCard.trailingAnchor.constraint(equalTo: trailingAnchor),
            sectionCard.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: sectionCard.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: sectionCard.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: sectionCard.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: sectionCard.bottomAnchor, constant: -16)
        ])
    }
    
}
