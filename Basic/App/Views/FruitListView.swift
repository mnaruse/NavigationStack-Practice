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
    @EnvironmentObject private var fruitDataModel: FruitDataModel

    var body: some View {
        NavigationStack {
            List(fruitDataModel.fruits) { fruit in
                NavigationLink(fruit.name, value: fruit)
            }
            .navigationTitle("フルーツ")
            .navigationDestination(for: Fruit.self) { fruit in
                FruitDetailView(fruit: fruit)
            }
        }
    }
}

// MARK: - FruitListView_Previews

struct FruitListView_Previews: PreviewProvider {
    struct Preview: View {
        @StateObject private var fruitDataModel = FruitDataModel()

        var body: some View {
            FruitListView()
                .environmentObject(fruitDataModel)
        }
    }

    static var previews: some View {
        Preview()
    }
}
