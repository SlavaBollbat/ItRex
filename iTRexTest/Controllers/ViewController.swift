//
//  ViewController.swift
//  iTRexTest
//
//  Created by Слава on 26.09.2018.
//  Copyright © 2018 Слава. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var activity = UIActivityIndicatorView()
    var films = [Film]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Films"
        
        activity.frame = CGRect(x: 0, y: 0, width: 16, height: 16)
        activity.center = tableView.center
        activity.hidesWhenStopped = true
        activity.color = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        self.view.addSubview(activity)
        tableView.isHidden = true
        activity.startAnimating()
        
        FilmNetworkService.getFilms { [weak self] (response) in
            
            self?.films = response.films
            self?.tableView.reloadData()
            self?.activity.stopAnimating()
            self?.tableView.isHidden = false
        }
        
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? FilmCell else { return UITableViewCell()}
        
        cell.configure(with: films[indexPath.row])
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: Constants.nameOfMainStoryboard, bundle: nil)
        guard let detailVC = storyboard.instantiateViewController(withIdentifier: Constants.detailVcIdentifier) as? DetailViewViewController else { return }
        detailVC.name = films[indexPath.row].name
        detailVC.nameEng = films[indexPath.row].nameEng
        detailVC.premiere = films[indexPath.row].premiere
        detailVC.descriptionInfo = films[indexPath.row].description
        
        if let imageUrl = URL(string: films[indexPath.row].image) {
            let data = try? Data(contentsOf: imageUrl)
            
            if let data = data {
                detailVC.image = UIImage(data: data)
                
            }
        }
        
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
}
