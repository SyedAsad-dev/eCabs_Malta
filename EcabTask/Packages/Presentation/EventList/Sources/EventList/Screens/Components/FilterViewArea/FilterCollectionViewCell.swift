//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 13/09/2024.
//

import Foundation
import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4)
        ])
        
        layer.cornerRadius = frame.height / 2
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        contentView.backgroundColor = UIColor.clear
    }
    
    func configure(with text: String, selectedFilter: String?) {
        label.text = text
        label.textColor = selectedFilter == text ? .orange : traitCollection.userInterfaceStyle == .dark ? .white : .black
    }
}
