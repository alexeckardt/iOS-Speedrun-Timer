//
//  CategoryPageView.swift
//  iOS-Speedrun-Timer
//
//  Created by Anita Eckardt on 2023-01-06.
//

import SwiftUI

struct CategoryPageView: View {
    var body: some View {
        
        ScrollView {
            
            LazyVStack {
                
                ForEach(0 ... 20, id: \.self) { i in
                    
                    //Show the Category Tabs
                    NavigationLink {
                        MilestonePageView()
                    } label: {
                        CategoryTabView(categoryIcon: "timer", categoryName: "Category")
                    }
                    
                }  
            }
        }
        
        //Navigation Header
        .navigationTitle("Categories")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct CategoryPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CategoryPageView()
        }
    }
}
