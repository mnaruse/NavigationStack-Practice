//
// FruitDataModel.swift
//
// Copyright (c) 2023 m_rn
// Created by Miharu Naruse on 2023/05/20.
//

import Foundation
import SwiftUI

// MARK: - FruitDataModel

/// フルーツのデータモデル
public class FruitDataModel: ObservableObject {
    /// フルーツの一覧
    @Published public var fruits: [Fruit] = []

    /// 初期化
    public init() {
        // モックデータを設定
        fruits = FruitDataModel.mockFruits
    }

    /// 関連するフルーツのIDの一覧をもとに、関連するフルーツの一覧を取得する
    /// - Parameter relatedFruitIDs: 関連するフルーツのIDの一覧
    /// - Returns: 関連するフルーツの一覧
    public func getRelatedFruits(from relatedFruitIDs: [UUID]) -> [Fruit] {
        return relatedFruitIDs.compactMap { relatedFruitID in
            fruits.first { $0.id == relatedFruitID }
        }
    }

    /// 旬の季節をもとに、旬のフルーツの一覧を取得する
    /// - Parameter season: 旬の季節
    /// - Returns: フルーツの一覧
    public func getFruits(in season: Season) -> [Fruit] {
        fruits.filter { $0.season == season }
    }
}

public extension FruitDataModel {
    /// フルーツのモックデータ
    static var mockFruits: [Fruit] = {
        let fruitsData: [Fruit] = [
            Fruit(name: "いちご", description: "甘くて美味しい春の果物", season: .spring, relatedFruitIDs: []),
            Fruit(name: "さくらんぼ", description: "赤くて可愛い果実", season: .spring, relatedFruitIDs: []),
            Fruit(name: "メロン", description: "高級な果物でみずみずしい", season: .spring, relatedFruitIDs: []),
            Fruit(name: "すいか", description: "夏にぴったりの果物", season: .summer, relatedFruitIDs: []),
            Fruit(name: "もも", description: "柔らかくジューシーな果実", season: .summer, relatedFruitIDs: []),
            Fruit(name: "プルーン", description: "甘酸っぱくて栄養豊富", season: .summer, relatedFruitIDs: []),
            Fruit(name: "ぶどう", description: "さまざまな品種がある果物", season: .autumn, relatedFruitIDs: []),
            Fruit(name: "りんご", description: "世界中で親しまれる果物", season: .autumn, relatedFruitIDs: []),
            Fruit(name: "梨", description: "シャキシャキとした食感が特徴", season: .autumn, relatedFruitIDs: []),
            Fruit(name: "みかん", description: "冬に美味しい柑橘類", season: .winter, relatedFruitIDs: []),
            Fruit(name: "ようなし", description: "甘くてジューシーな梨", season: .winter, relatedFruitIDs: []),
            Fruit(name: "いよかん", description: "さっぱりとした味わいの柑橘類", season: .winter, relatedFruitIDs: [])
        ]

        var fruits: [Fruit] {
            return fruitsData.map { fruit in
                let relatedFruitIDs = fruitsData
                    .filter { $0.season == fruit.season && $0.id != fruit.id }
                    .map { $0.id }
                return Fruit(
                    id: fruit.id,
                    name: fruit.name,
                    description: fruit.description,
                    season: fruit.season,
                    relatedFruitIDs: relatedFruitIDs + fruit.relatedFruitIDs
                )
            }
        }

        return fruits
    }()
}
