//
//  Film.swift
//  iTRexTest
//
//  Created by Слава on 26.09.2018.
//  Copyright © 2018 Слава. All rights reserved.
//

import Foundation


class List: Decodable {
    let list: [Film]
    init(list: [Film]) {
        self.list = list
    }
}

class Film: Decodable {
    
    let image: String
    let name: String
    let name_eng: String
    let premiere: String
    let description: String
    
    init(image: String, name: String, nameEng: String, premiere: String, description: String) {
        self.image = image
        self.name = name
        self.name_eng = nameEng
        self.premiere = premiere
        self.description = description
    }
    
}
