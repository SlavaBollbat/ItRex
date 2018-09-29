//
//  FilmCell.swift
//  iTRexTest
//
//  Created by Слава on 26.09.2018.
//  Copyright © 2018 Слава. All rights reserved.
//

import UIKit

class FilmCell: UITableViewCell {
    
    @IBOutlet weak var imageCell: UIImageView! {
        didSet {
            imageCell.layer.cornerRadius = imageCell.frame.size.height / 2
            imageCell.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var engNameLabel: UILabel!
    @IBOutlet weak var premierLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        descriptionLabel.numberOfLines = 0
        
    }
    
    func configure(with film: Film) {
        nameLabel.text = film.name
        engNameLabel.text = film.nameEng
        premierLabel.text = film.premiere
        descriptionLabel.text = film.description
        if let imageURL = URL(string: film.image) {
            if let data = try? Data(contentsOf: imageURL) {
                imageCell.image = UIImage(data: data)
            }
        }
        
    }
    
}
