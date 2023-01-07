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
            
            ZStack(alignment: .bottomTrailing) {
                
                //Scrolling The Categories
                ScrollView {
                    LazyVStack {
                        
                        //Go Over the Tabs
                        ForEach(0 ... 20, id: \.self) { i in
                            
                            //Show the Milestone
                            MilestoneTabView(milestoneName: "1-" + String(i))
                            
                        }
                        
                        //History
                        prevRunHistoryButton
                    }
                }
                
                //New Run Button
                NavigationLink {
                    //
                } label: {
                    Image(systemName: "hourglass.tophalf.filled")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 45, height: 45)
                        .padding(20)
                }
                .background(Color(.systemBlue))
                .foregroundColor(Color(.systemBackground))
                .clipShape(Circle())
                .padding()
                
            }
            //
            //Timer
            VStack {

                //Divide Top
                Divider()
                
                //Final
                Text("PB")
                    .font(.caption)
                    .foregroundColor(Color(.systemGray))
                    .padding(.top)
                
                TimeView(timeElapsed: Date().distance(to: Date()))
            
                
            }
        }
        
        //Navigation Header
        .navigationTitle("Categories")
        .navigationBarTitleDisplayMode(.inline)
        
        //Toolbar, Edit Bar
        
    }
}

extension MilestonePageView {
    
    var prevRunHistoryButton : some View {
        
        NavigationLink {
            //
        } label: {
            Text("Previous Run History")
                .font(.caption)
                .padding()
        }
    }
    
}

struct MilestonePageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MilestonePageView()
        }
    }
}
