//
// MultipleTypesOfDataApp.swift
//
// Copyright (c) 2023 m_rn
// Created by Miharu Naruse on 2023/05/20.
//

import FruitLibrary
import SwiftUI

@main
struct MultipleTypesOfDataApp: App {
    @StateObject private var fruitDataModel = FruitDataModel()
    @State private var path = NavigationPath()

    var body: some Scene {
        WindowGroup {
            SeasonListView(path: $path)
                .environmentObject(fruitDataModel)
        }
    }
}
