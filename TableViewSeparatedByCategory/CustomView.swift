//
//  CustomView.swift
//  TableViewSeparatedByCategory
//
//  Created by 염성필 on 2023/09/01.
//

import UIKit
import SnapKit

class CustomView: UIView {
    
    let tableView = {
        let tableView = UITableView()
        tableView.rowHeight = 100
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: String(describing: MovieTableViewCell.self))
        tableView.register(TVTableViewCell.self, forCellReuseIdentifier: String(describing: TVTableViewCell.self))
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        self.addSubview(tableView)
    }
    
    func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
