//
//  ViewController.swift
//  TableViewSeparatedByCategory
//
//  Created by 염성필 on 2023/09/01.
//

import UIKit

class ViewController: UIViewController {
    
    
    let customView = CustomView()
    
    override func loadView() {
        self.view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        DataManager.shared.callRequest { movieData, tvData in
            print("movieData",movieData)
            print("tvData",tvData)
        }
        
        
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
    }


}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TableViewCell.self), for: indexPath) as? TableViewCell else { return UITableViewCell() }
        
        
        return cell
    }
}
