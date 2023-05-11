//
//  Model.swift
//  TripPlanner
//
//  Created by Yasmin araujo on 10/05/2023.
//

import Foundation

struct Model {
    var dataSelec: Date
    var nomeCidade: String
    var orcamento: Int
    var custoDia: Int
}

var exemplo = Model(dataSelec: Date.now, nomeCidade: "Nova York", orcamento: 3000, custoDia: 600)
