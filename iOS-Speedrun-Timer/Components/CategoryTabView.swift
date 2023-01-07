//
//  CategoryTabView.swift
//  iOS-Speedrun-Timer
//
//  Created by Anita Eckardt on 2023-01-06.
//

import SwiftUI

struct CategoryTabView: View {
    
    let categoryIcon : String
    let categoryName : String
    
    var body: some View {
        
        VStack(alignment: .leading) {
        
            HStack {
                
                //icon
                Image(systemName: categoryIcon)
                    .font(.title2)
            
                //Game Info
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text(categoryName)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
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

struct CategoryTabView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryTabView(categoryIcon: "question", categoryName: "question")
    }
}
