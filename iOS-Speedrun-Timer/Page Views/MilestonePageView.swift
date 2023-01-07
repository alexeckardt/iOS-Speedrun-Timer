//
//  MilestonePageView.swift
//  iOS-Speedrun-Timer
//
//  Created by Anita Eckardt on 2023-01-06.
//

import SwiftUI

struct MilestonePageView: View {
    var body: some View {
        
        VStack {
            
            //Scrolling
            ScrollView {
                LazyVStack {
                    ForEach(0 ... 20, id: \.self) { i in
                        
                        //Show the Milestone
                        MilestoneTabView(milestoneName: "1-" + String(i))
                        
                    }
                }
            }
            
            //
            //Timer Info
            TimerView()
        }
        
        //Navigation Header
        .navigationTitle("Categories")
        .navigationBarTitleDisplayMode(.inline)
        
        //Toolbar, Edit Bar
        
    }
}

struct MilestonePageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MilestonePageView()
        }
    }
}
