//
// OneTypeOfDataApp.swift
//
// Copyright (c) 2023 m_rn
// Created by Miharu Naruse on 2023/05/20.
//

import FruitLibrary
import SwiftUI

@main
struct OneTypeOfDataApp: App {
    @StateObject private var fruitDataModel = FruitDataModel()
    @State private var path: [Fruit] = []

    var body: some Scene {
        WindowGroup {
            FruitListView(path: $path)
                .environmentObject(fruitDataModel)
        }
    }
}
