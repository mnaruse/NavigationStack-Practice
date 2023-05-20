//
// EndlessApp.swift
//
// Copyright (c) 2023 m_rn
// Created by Miharu Naruse on 2023/05/20.
//

import FruitLibrary
import SwiftUI

@main
struct EndlessApp: App {
    @StateObject private var fruitDataModel = FruitDataModel()

    var body: some Scene {
        WindowGroup {
            FruitListView()
                .environmentObject(fruitDataModel)
        }
    }
}
