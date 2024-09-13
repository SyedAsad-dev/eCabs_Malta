//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 13/09/2024.
//

import Foundation
import UIKit
import Domain
import Combine

class EventsScrollView: UIView {
    
    weak var viewModel: EventListViewModel!
    var tableView: UITableView
    let cellId = "Cell"
    var didTap: ((GitHubEvent) -> Void)?
    private var cancellables = Set<AnyCancellable>()
    
    init(
        frame: CGRect,
        viewModel: EventListViewModel
    ) {
        tableView = UITableView(frame: .zero, style: .plain)
        super.init(frame: frame)
        
        self.viewModel = viewModel
        setupTableView()
        bindViewModel()
    }
    
    func setupTableView() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(EventsTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none // Optional: to remove cell separators
    }
    
    private func bindViewModel() {
        viewModel.$filteredList
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                guard let self = self else { return }
                self.tableView.reloadData()
            }
            .store(in: &cancellables)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EventsScrollView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filteredList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? EventsTableViewCell else { return UITableViewCell() }
        cell.configure(with: viewModel.filteredList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didTap?(viewModel.filteredList[indexPath.row])
    }

}

