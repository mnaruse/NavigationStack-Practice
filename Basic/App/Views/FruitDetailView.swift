//
// FruitDetailView.swift
//
// Copyright (c) 2023 m_rn
// Created by Miharu Naruse on 2023/05/20.
//

import FruitLibrary
import SwiftUI

// MARK: - FruitDetailView

/// フルーツ詳細のビュー
struct FruitDetailView: View {
    let fruit: Fruit

    var body: some View {
        List {
            Section("説明") {
                Text(fruit.description)
                    .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
        .navigationTitle(fruit.name)
    }
}

// MARK: - FruitDetailView_Previews

struct FruitDetailView_Previews: PreviewProvider {
    struct Preview: View {
        let fruit = FruitDataModel.mockFruits.first!

        var body: some View {
            NavigationStack {
                FruitDetailView(fruit: fruit)
            }
        }
    }

    static var previews: some View {
        Preview()
    }
}
