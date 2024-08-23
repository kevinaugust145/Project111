//
//  GirlNames.swift
//  Project111
//
//  Created by 洪宗燦 on 2024/8/18.
//

// 女孩名 thats a girl names file fjk
struct GirlNames: Decodable {
    let names: [Names]
}

struct Names: Decodable {
    let first_name: String
    let last_name: String
}
