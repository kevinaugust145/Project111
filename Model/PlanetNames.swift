//
//  PlanetNames.swift
//  Project111
//
//  Created by 洪宗燦 on 2024/8/18.
//

// 星球名
struct PlanetNames: Decodable {
    let planetNames: [PlanetName]
}

struct PlanetName: Decodable {
    let name: String
}
