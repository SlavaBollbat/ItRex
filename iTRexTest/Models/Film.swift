//
//  Film.swift
//  iTRexTest
//
//  Created by Слава on 26.09.2018.
//  Copyright © 2018 Слава. All rights reserved.
//

import Foundation


struct List: Decodable {
    let list: [Film]
}

struct Film: Decodable {
    
    let image: String
    let name: String
    let name_eng: String
    let premiere: String
    let description: String
    
}
