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
                    GameTabView(gameIcon: "gamecontroller", gameName: "Name", numCategories: 0)
                    
                }
                
            }
            
        }
        
    }
}

struct GamePageView_Previews: PreviewProvider {
    static var previews: some View {
        GamePageView()
    }
}
