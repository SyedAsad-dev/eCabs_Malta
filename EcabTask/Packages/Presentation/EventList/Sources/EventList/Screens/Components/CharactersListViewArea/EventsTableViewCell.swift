//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 13/09/2024.
//

import UIKit
import Kingfisher
import Domain

class EventsTableViewCell: UITableViewCell {
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        view.layer.cornerRadius = 20
        return view
    }()
    
    let eventImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let speciesLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(eventImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(speciesLabel)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            eventImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            eventImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15),
            eventImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -15),
            eventImageView.widthAnchor.constraint(equalToConstant: 90),
            eventImageView.heightAnchor.constraint(equalToConstant: 90),
            
            nameLabel.leadingAnchor.constraint(equalTo: eventImageView.trailingAnchor, constant: 8),
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            
            speciesLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            speciesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            speciesLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
        ])
    }
    
    func configure(with event: GitHubEvent) {
        if let url = URL(string: event.actor?.avatarURL ?? "") {
            eventImageView.kf.setImage(with: url)
        }
        nameLabel.text = event.repo?.name ?? ""
        speciesLabel.text = event.type ?? ""
    }
}
