//
//  DetailNoteView.swift
//  Tini
//
//  Created by Omodauda on 13/05/2025.
//

import UIKit

class DetailNoteView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(hex: Colors.titleText)
        label.text = "Detail notes"
        return label
    }()
    
    private let noteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(hex: "#DDDDE3").cgColor
        return view
    }()
    
    private let noteInput: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = .systemFont(ofSize: 14, weight: .regular)
        textView.textColor = UIColor(hex: Colors.titleText)
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 16, bottom: 34, right: 16)
        textView.backgroundColor = .clear
        textView.text = "Your note"
        textView.textColor = UIColor(hex: Colors.secondary)
        return textView
    }()
    
    private let wordCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor(hex: Colors.secondary)
        label.textAlignment = .right
        label.text = "(0/100)"
        return label
    }()
    
    var detailNote: String {
        return noteInput.text ?? ""
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(titleLabel)
        addSubview(noteView)
        noteView.addSubview(noteInput)
        noteInput.delegate = self
        noteView.addSubview(wordCountLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            noteView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            noteView.leadingAnchor.constraint(equalTo: leadingAnchor),
            noteView.trailingAnchor.constraint(equalTo: trailingAnchor),
            noteView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            noteInput.topAnchor.constraint(equalTo: noteView.topAnchor),
            noteInput.leadingAnchor.constraint(equalTo: noteView.leadingAnchor),
            noteInput.trailingAnchor.constraint(equalTo: noteView.trailingAnchor),
            noteInput.bottomAnchor.constraint(equalTo: noteView.bottomAnchor, constant: -32),
            noteInput.heightAnchor.constraint(equalToConstant: 70),
            
            wordCountLabel.bottomAnchor.constraint(equalTo: noteView.bottomAnchor, constant: -16),
            wordCountLabel.trailingAnchor.constraint(equalTo: noteView.trailingAnchor, constant: -16),
        ])
    }
    
}

extension DetailNoteView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
        textView.textColor = .black
    }
    
    func textViewDidChange(_ textView: UITextView) {
        wordCountLabel.text = "(\(textView.text.count)/100)"
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // get the current text, or use an empty string if that failed
        let currentText = textView.text ?? ""

        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }

        // add their new text to the existing text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: text)

        // make sure the result is under 16 characters
        return updatedText.count <= 100
    }
}
