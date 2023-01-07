//
//  ContentView.swift
//  iOS-Speedrun-Timer
//
//  Created by Alex Eckardt on 2023-01-05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            GamePageView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
