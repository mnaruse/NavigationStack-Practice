//
// FruitListView.swift
//
// Copyright (c) 2023 m_rn
// Created by Miharu Naruse on 2023/05/20.
//

import FruitLibrary
import SwiftUI

// MARK: - FruitListView

/// フルーツ一覧のビュー
struct FruitListView: View {
    let season: Season
    let fruits: [Fruit]
    @Binding var path: NavigationPath

    var body: some View {
        List(fruits) { fruit in
            NavigationLink(fruit.name, value: fruit)
        }
        .navigationTitle("\(season.rawValue)のフルーツ")
        .navigationDestination(for: Fruit.self) { fruit in
            FruitDetailView(fruit: fruit, path: $path)
        }
    }
}

// MARK: - FruitListView_Previews

struct FruitListView_Previews: PreviewProvider {
    struct Preview: View {
        @StateObject private var fruitDataModel = FruitDataModel()
        @State private var path = NavigationPath()

        let season: Season = .summer

        var fruits: [Fruit] {
            fruitDataModel.getFruits(in: season)
        }

        var body: some View {
            NavigationStack(path: $path) {
                FruitListView(season: season, fruits: fruits, path: $path)
            }
            .environmentObject(fruitDataModel)
        }
    }

    static var previews: some View {
        Preview()
    }
}
