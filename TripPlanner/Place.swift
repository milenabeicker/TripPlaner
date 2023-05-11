//
//  Place.swift
//  TripPlanner
//
//  Created by Yasmin araujo on 10/05/2023.
//

import Foundation

struct Place: Identifiable {
    var id = UUID()
    var imageName: String
    var title: String
    var price: Double
}

var placesNY = [
        Place(imageName: "estatua-da-liberdade", title: "Estátua da Liberdade", price: 130),
        Place(imageName: "times-square", title: "Times Square", price: 0),
        Place(imageName: "biblioteca", title: "Biblioteca Pública", price: 0),
        Place(imageName: "grand-central", title: "Grand Central", price: 0),
        Place(imageName: "moma", title: "MoMA", price: 125),
        Place(imageName: "top-of-the-rock", title: "Top of The Rock", price: 250),
        Place(imageName: "oculus", title: "Oculus Station", price: 0),
        Place(imageName: "memorial-11-de-setembro", title: "Memorial 11 de Setembro", price: 125),
        Place(imageName: "empire-state", title: "Empire State Building", price: 250),
        Place(imageName: "central-park", title: "Central Park", price: 0)
]
