//
//  ViewController.swift
//  TableViewSeparatedByCategory
//
//  Created by 염성필 on 2023/09/01.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    var mediaData: TMDBMedia = TMDBMedia(results: [])
    
    
    
    let customView = CustomView()
    
    var movieData: [TMDBResult?] = []
    var tvData: [TMDBResult?] = []
    
    override func loadView() {
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settup()
        
        //        NetworkManager.shared.callRequest { response in
        //            guard let response else { return }
        //            self.mediaData = response
        //            print("여기에 데이터 들어오나요? ",self.mediaData)
        //            DispatchQueue.main.async {
        //                self.customView.tableView.reloadData()
        //            }
        //        }
        //
        NetworkManager.shared.callRequest { result in
            switch result {
            case .success(let response):
                guard let response else { return }
                self.mediaData = response
                
                DispatchQueue.main.async {
                    self.customView.tableView.reloadData()
                }
            case .failure(let failure):
                print("실패원인",failure.debugDescription)
            }
        }
        
        
    }
    
    func settup() {
        
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
        
    }
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("카운트는?",movieData.count, tvData.count)
        
        return mediaData.results.count
        //  return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = mediaData.results[indexPath.row]
        let mediatype = mediaData.results[indexPath.row].mediaType!
        switch mediatype {
        case .movie:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MovieTableViewCell.self), for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
            let url = URL(string: row.imageUrl)!
            cell.mediaImageView.kf.setImage(with: url)
            cell.titleLabel.text = row.title
            cell.descriptionLabel.text = row.overview
            return cell
        case .tv:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TVTableViewCell.self), for: indexPath) as? TVTableViewCell else { return UITableViewCell() }
            
            let url = URL(string: row.imageUrl)!
            
            
            DispatchQueue.global().async {
                let data = try! Data(contentsOf: url)
                
                DispatchQueue.main.async {
                    cell.mediaImageView.image = UIImage(data: data)
                }
            }
            
            cell.titleLabel.text = row.name
            cell.descriptionLabel.text = row.overview
            cell.setConstraints()
            return cell
        }
        
    }
}
