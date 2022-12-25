//
//  ContentView.swift
//  AbstractFactory
//
//  Created by 김종권 on 2022/12/25.
//

import SwiftUI

    struct ContentView: View {
        var body: some View {
            ViewFactory.getNavigation() {
                Text("title")
            }
        }
    }

enum ViewFactory {
    @ViewBuilder
    static func getNavigation<Content: View>(content: () -> Content) -> some View {
        if #available(iOS 16, *) {
            NavigationStack(root: content)
        } else {
            NavigationView(content: content)
        }
    }
}
