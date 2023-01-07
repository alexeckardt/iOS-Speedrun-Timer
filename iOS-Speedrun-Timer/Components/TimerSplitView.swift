//
//  TimerSplitView.swift
//  iOS-Speedrun-Timer
//
//  Created by Anita Eckardt on 2023-01-06.
//

import SwiftUI

struct TimerSplitView: View {
    var body: some View {
        //Current Split
        HStack {
            
            Text("1-1:")
                .font(.subheadline)
                .foregroundColor(Color(.systemGray))
            
            Text("0:00")
                .font(.subheadline).bold()
            
        }
    }
}

struct TimerSplitView_Previews: PreviewProvider {
    static var previews: some View {
        TimerSplitView()
    }
}
