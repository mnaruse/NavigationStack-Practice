//
// Fruit.swift
//
// Copyright (c) 2023 m_rn
// Created by Miharu Naruse on 2023/05/20.
//

import Foundation

/// フルーツ
public struct Fruit: Identifiable, Hashable {
    /// ID
    public let id: UUID
    /// 名前
    public let name: String
    /// 説明
    public let description: String
    /// 旬の季節
    public let season: Season
    /// 関連するフルーツ
    public let relatedFruitIDs: [UUID]

    /// 初期化
    /// - Parameters:
    ///   - id: ID
    ///   - name: 名前
    ///   - description: 説明
    ///   - season: 旬の季節
    ///   - relatedFruitIDs: 関連するフルーツ
    init(id: UUID = UUID(), name: String, description: String, season: Season, relatedFruitIDs: [UUID]) {
        self.id = id
        self.name = name
        self.description = description
        self.season = season
        self.relatedFruitIDs = relatedFruitIDs
    }
}
