# 「ゆめみ大技林 '23」の記事「iOS16+ SwiftUI のナビゲーション」のサンプルコード

このソースコードを使った記事は技術書典で配布している「[ゆめみ大技林 '23](https://techbookfest.org/product/pTZvmVyZJG2Mjyqs9SUWdd?productVariantID=tqRci9Rc5Qri99GHd9UjEa)」に収録しています。ぜひご覧ください。

## 開発環境

- Xcode 14.2
- Swift 5.7

## 使い方

[NavigationStack-Practice.xcworkspace](NavigationStack-Practice.xcworkspace) をダブルクリックしてXcodeを開いてください。

複数のターゲットがありますので、目的のターゲットに切り替えて Run してください。

## 「ゆめみ大技林 '23」の記事「iOS16+ SwiftUI のナビゲーション」との対応

1. フルーツや季節の構造体やデータモデル

  - [FruitLibrary](FruitLibrary/Sources/FruitLibrary)
    - [Fruit.swift](FruitLibrary/Sources/FruitLibrary/Models/Fruit.swift)
    - [Season.swift](FruitLibrary/Sources/FruitLibrary/Models/Season.swift)
    - [FruitDataModel.swift](FruitLibrary/Sources/FruitLibrary/Repositories/FruitDataModel.swift)

2. もっとも基本的なコードを眺める

  - [Basic](Basic)
    - [FruitListView.swift](Basic/App/Views/FruitListView.swift) 
    - [FruitDetailView.swift](Basic/App/Views/FruitDetailView.swift) 
    - [BasicApp.swift](Basic/App/BasicApp.swift)

3. NavigationLinkとnavigationDestination modifier の関係をより理解する

  - [Endless](Endless)
    - [FruitListView.swift](Endless/App/Views/FruitListView.swift) 
    - [FruitDetailView.swift](Endless/App/Views/FruitDetailView.swift) 
    - [EndlessApp.swift](Endless/App/EndlessApp.swift)

4. ナビゲーションスタックで１種類のデータを表示する場合

  - [OneTypeOfData](OneTypeOfData)
    - [FruitListView.swift](OneTypeOfData/App/Views/FruitListView.swift) 
    - [FruitDetailView.swift](OneTypeOfData/App/Views/FruitDetailView.swift) 
    - [OneTypeOfDataApp.swift](OneTypeOfData/App/OneTypeOfDataApp.swift)

5. ナビゲーションスタックで異なる種類のデータを表示する場合

  - [MultipleTypesOfData](MultipleTypesOfData)
    - [FruitListView.swift](MultipleTypesOfData/App/Views/FruitListView.swift) 
    - [FruitDetailView.swift](MultipleTypesOfData/App/Views/FruitDetailView.swift) 
    - [MultipleTypesOfDataApp.swift](MultipleTypesOfData/App/MultipleTypesOfDataApp.swift)
