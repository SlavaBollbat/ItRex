//
//  Film.swift
//  iTRexTest
//
//  Created by Слава on 26.09.2018.
//  Copyright © 2018 Слава. All rights reserved.
//

import Foundation


struct Film: Decodable {
    
    let image: String
    let name: String
    let nameEng: String
    let premiere: String
    let description: String
    
    
    init?(dict: [String: Any]) {
        guard let description = dict["description"] as? String,
        let image = dict["image"] as? String,
            let name = dict["name"] as? String,
            let nameEng = dict["name_eng"] as? String,
            let premiere = dict["premiere"] as? String else { return nil}
        
        self.image = image
        self.name = name
        self.nameEng = nameEng
        self.premiere = premiere
        self.description = description
        
    }
    
    
}



