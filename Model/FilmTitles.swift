//
//  MovieTitles.swift
//  Project111
//
//  Created by 洪宗燦 on 2024/8/18.
//

// 電影名
struct FilmsTitles: Decodable {
    let filmTitles: [FilmTitles]
}

struct FilmTitles: Decodable {
    let title: String
}
