//
//  DetailViewViewController.swift
//  iTRexTest
//
//  Created by Слава on 26.09.2018.
//  Copyright © 2018 Слава. All rights reserved.
//

import UIKit

class DetailViewViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.size.height / 4
            imageView.layer.masksToBounds = true
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.layer.borderWidth = 10.0
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameEngLabel: UILabel!
    @IBOutlet weak var premiereLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var name = String()
    var nameEng = String()
    var premiere = String()
    var descriptionInfo = String()
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = nameEng
        view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        
        descriptionLabel.numberOfLines = 0
        nameLabel.text = name
        premiereLabel.text = premiere
        descriptionLabel.text = descriptionInfo
        imageView.image = image
        
    }
    



}


