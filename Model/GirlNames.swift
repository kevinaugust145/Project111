//
//  GirlNames.swift
//  Project111
//
//  Created by 洪宗燦 on 2024/8/18.
//

// 女孩名
struct GirlNames: Decodable {
    let names: [Names]
}

struct Names: Decodable {
    let firstName: String
    let lastName: String
}
