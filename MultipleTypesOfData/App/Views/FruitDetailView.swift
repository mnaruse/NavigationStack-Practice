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
    @EnvironmentObject private var fruitDataModel: FruitDataModel

    let fruit: Fruit
    @Binding var path: NavigationPath

    var body: some View {
        List {
            Section("説明") {
                Text(fruit.description)
                    .listRowSeparator(.hidden)
            }

            Section("関連するフルーツ") {
                /// 関連するフルーツの一覧
                let relatedFruits = fruitDataModel.getRelatedFruits(from: fruit.relatedFruitIDs)

                ForEach(relatedFruits) { relatedFruit in
                    NavigationLink(relatedFruit.name, value: relatedFruit)
                        .listRowSeparator(.hidden)
                        .foregroundColor(.accentColor)
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle(fruit.name)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                backToRootToolBarItem
            }
        }
    }

    // MARK: Views

    private var backToRootToolBarItem: some View {
        Button {
            backToRoot()
        } label: {
            Label("ルート画面に一気に戻る", systemImage: "chevron.backward.2")
                .foregroundColor(.accentColor)
        }
    }

    // MARK: Functions

    func backToRoot() {
        path.removeLast(path.count)
    }
}

// MARK: - FruitDetailView_Previews

struct FruitDetailView_Previews: PreviewProvider {
    struct Preview: View {
        @StateObject private var fruitDataModel = FruitDataModel()
        @State private var path = NavigationPath()

        let fruit = FruitDataModel.mockFruits.first!

        var body: some View {
            NavigationStack {
                FruitDetailView(fruit: fruit, path: $path)
            }
            .environmentObject(fruitDataModel)
        }
    }

    static var previews: some View {
        Preview()
    }
}
