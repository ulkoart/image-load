//
//  Models.swift
//  image-load
//
//  Created by user on 18/11/2019.
//  Copyright © 2019 Artem Ulko. All rights reserved.
//

import Foundation

struct SpaceInfo: Decodable {
    let message: String
    let number: Int
    let people: [Astronaut]
}

struct Astronaut: Decodable {
    let name: String
    let craft: String
}
