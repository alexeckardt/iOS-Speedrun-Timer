//
//  MilestoneTabView.swift
//  iOS-Speedrun-Timer
//
//  Created by Anita Eckardt on 2023-01-06.
//

import SwiftUI

struct MilestoneTabView: View {
    
    let milestoneName : String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                
                //icon
                Image(systemName: "timer")
                    .font(.title2)
                
                //Game Info
                VStack(alignment: .leading) {
                    
                    tabname
                    
                    bestTimeInfo
                    
                }
                .padding(.horizontal)
                
                //Spacer
                Spacer()
                
            }
            .padding()
            
            Divider()
            
        }
    }
}
//
//
//
extension MilestoneTabView {
    
    var tabname : some View {
        
        //Name from Var
        Text(milestoneName)
            .font(.title2)
            .fontWeight(.semibold)
        
    }
    
    var bestTimeInfo : some View {
        
        HStack(spacing: 5) {
            
            //PB
            Text("PB:")
                .font(.subheadline)
                .foregroundColor(Color(.systemGray))
            
            //Actual Time
            Text("0:00")
                .font(.subheadline).bold()
                .foregroundColor(Color(.systemGreen))
        }
    }
    
}
//
struct MilestoneTabView_Previews: PreviewProvider {
    static var previews: some View {
        MilestoneTabView(milestoneName: "1-1")
    }
}
