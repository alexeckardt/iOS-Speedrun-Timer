//
//  GamePageView.swift
//  iOS-Speedrun-Timer
//
//  Created by Alex Eckardt on 2023-01-06.
//

import SwiftUI

struct GamePageView: View {
    var body: some View {
        
        ScrollView {
            
            LazyVStack {
                
                ForEach(0 ... 20, id: \.self) { i in
                    
                    //Show the Game Tabs
                    NavigationLink {
                        CategoryPageView()
                    } label: {
                        GameTabView(gameIcon: "gamecontroller", gameName: "Game", numCategories: 0)
                    }
                    
                }
                
            }
            
        }
        //Navigation Header
        .navigationTitle("Games")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct GamePageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GamePageView()
        }
    }
}
