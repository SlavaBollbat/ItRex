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
    
    private var list = Array<Film>()
    var activity = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activity.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        activity.center = tableView.center
        activity.hidesWhenStopped = true
        activity.color = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        self.view.addSubview(activity)
        tableView.isHidden = true
        activity.startAnimating()
        
      
        self.title = "Best films"
        getData()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    func getData() {
        
        var dataUrlComponents = URLComponents()
        
        dataUrlComponents.scheme = "http"
        dataUrlComponents.host = "www.mocky.io"
        dataUrlComponents.path = "/v2/57cffac8260000181e650041"
        
        guard let url = dataUrlComponents.url else { return }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print(error)
            }
            
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
            
            guard let downloadList = try? JSONDecoder().decode(List.self, from: data) else { return }
            
            self.list = downloadList.list
            DispatchQueue.main.async {
                self.activity.stopAnimating()
                self.tableView.reloadData()
                self.tableView.isHidden = false
                
            }
        }
        task.resume()
        
    }
    
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? FilmCell else { return UITableViewCell()}
        
        cell.nameLabel.text = list[indexPath.row].name
        cell.engNameLabel.text = list[indexPath.row].name_eng
        cell.descriptionLabel.text = list[indexPath.row].description
        cell.premierLabel.text = list[indexPath.row].premiere
        
        if let imageUrl = URL(string: list[indexPath.row].image) {
            let data = try? Data(contentsOf: imageUrl)
            
            if let data = data {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    cell.imageCell.image = image
                }
            }
        }
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: Constants.nameOfMainStoryboard, bundle: nil)
        guard let detailVC = storyboard.instantiateViewController(withIdentifier: Constants.detailVcIdentifier) as? DetailViewViewController else { return }
        detailVC.name = list[indexPath.row].name
        detailVC.nameEng = list[indexPath.row].name_eng
        detailVC.premiere = list[indexPath.row].premiere
        detailVC.descriptionInfo = list[indexPath.row].description
 
        if let imageUrl = URL(string: list[indexPath.row].image) {
            let data = try? Data(contentsOf: imageUrl)
            
            if let data = data {
                detailVC.image = UIImage(data: data)
                
            }
        }
        
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
}
