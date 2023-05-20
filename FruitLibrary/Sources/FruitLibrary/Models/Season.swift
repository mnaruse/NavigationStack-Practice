//
// Season.swift
//
// Copyright (c) 2023 m_rn
// Created by Miharu Naruse on 2023/05/20.
//

import Foundation

// MARK: - Season

/// 季節
public enum Season: String, CaseIterable {
    /// 春
    case spring = "春"
    /// 夏
    case summer = "夏"
    /// 秋
    case autumn = "秋"
    /// 冬
    case winter = "冬"
}

// MARK: Identifiable

extension Season: Identifiable {
    /// ID
    public var id: Self {
        self
    }
}
