//
//  GameComponent.swift
//  iOS-Speedrun-Timer
//
//  Created by Alex Eckardt on 2023-01-06.
//

import SwiftUI

struct GameTabView: View {
    
    let gameIcon : String
    let gameName : String
    let numCategories : Int
    
    var body: some View {
        
        VStack(alignment: .leading) {
        
            HStack {
                
                //icon
                Image(systemName: gameIcon)
                    .font(.title2)
            
                //Game Info
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text(gameName)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(String(numCategories) + " Categories")
                        .font(.subheadline)
                    
                }
                .padding(.horizontal)
                
                //Spacer
                Spacer()
                
                //Continue Icon
                RightArrow()

            }
            .padding()
              
            Divider()
            
        }
    }
}

struct GameTabView_Previews: PreviewProvider {
    static var previews: some View {
        GameTabView(gameIcon: "gamecontroller", gameName: "Game Name", numCategories: 0)
    }
}
