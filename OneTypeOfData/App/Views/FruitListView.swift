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

    @Binding var path: [Fruit]

    var body: some View {
        NavigationStack(path: $path) {
            List(fruitDataModel.fruits) { fruit in
                NavigationLink(fruit.name, value: fruit)
            }
            .navigationTitle("フルーツ")
            .navigationDestination(for: Fruit.self) { fruit in
                FruitDetailView(fruit: fruit, path: $path)
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    showFruitsToolBarItem
                }
            }
        }
    }

    // MARK: Views

    private var showFruitsToolBarItem: some View {
        Button {
            showFruits()
        } label: {
            Label("いちご→メロン→さくらんぼのナビゲーションスタック", systemImage: "sparkles.rectangle.stack.fill")
                .foregroundColor(.accentColor)
        }
    }

    // MARK: Functions

    private func showFruits() {
        path = [
            FruitDataModel.mockFruits[0],
            FruitDataModel.mockFruits[2],
            FruitDataModel.mockFruits[1]
        ]
    }
}

// MARK: - FruitListView_Previews

struct FruitListView_Previews: PreviewProvider {
    struct Preview: View {
        @StateObject private var fruitDataModel = FruitDataModel()
        @State private var path: [Fruit] = []

        var body: some View {
            FruitListView(path: $path)
                .environmentObject(fruitDataModel)
        }
    }

    static var previews: some View {
        Preview()
    }
}
