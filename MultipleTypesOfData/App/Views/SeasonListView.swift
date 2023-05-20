//
// SeasonListView.swift
//
// Copyright (c) 2023 m_rn
// Created by Miharu Naruse on 2023/05/20.
//

import FruitLibrary
import SwiftUI

// MARK: - SeasonListView

/// 季節一覧のビュー
struct SeasonListView: View {
    @EnvironmentObject private var fruitDataModel: FruitDataModel

    @Binding var path: NavigationPath

    var body: some View {
        NavigationStack(path: $path) {
            List(Season.allCases) { season in
                NavigationLink(season.rawValue, value: season)
            }
            .navigationTitle("旬")
            .navigationDestination(for: Season.self) { season in
                /// 旬のフルーツの一覧
                let seasonalFruits = fruitDataModel.getFruits(in: season)

                FruitListView(season: season, fruits: seasonalFruits, path: $path)
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    showSeasonAndFruitsToolBarItem
                }
            }
        }
    }

    // MARK: Views

    private var showSeasonAndFruitsToolBarItem: some View {
        Button {
            showSeasonAndFruits()
        } label: {
            Label("春→いちご→メロン→さくらんぼのナビゲーションスタック", systemImage: "sparkles.rectangle.stack.fill")
                .foregroundColor(.accentColor)
        }
    }

    // MARK: Functions

    private func showSeasonAndFruits() {
        var newPath = NavigationPath()
        newPath.append(Season.spring)
        newPath.append(FruitDataModel.mockFruits[0])
        newPath.append(FruitDataModel.mockFruits[2])
        newPath.append(FruitDataModel.mockFruits[1])

        path = newPath
    }
}

// MARK: - SeasonListView_Previews

struct SeasonListView_Previews: PreviewProvider {
    struct Preview: View {
        @StateObject private var fruitDataModel = FruitDataModel()
        @State private var path = NavigationPath()

        let fruits = FruitDataModel.mockFruits

        var body: some View {
            SeasonListView(path: $path)
                .environmentObject(fruitDataModel)
        }
    }

    static var previews: some View {
        Preview()
    }
}
