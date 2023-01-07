//
//  TimerSplitView.swift
//  iOS-Speedrun-Timer
//
//  Created by Anita Eckardt on 2023-01-06.
//

import SwiftUI

struct TimerSplitView: View {
    
    let splitInfo : SplitDisplayStruct
    
    var body: some View {
        //Current Split
        HStack {
            
            Text(splitInfo.splitName)
                .font(.subheadline)
                .foregroundColor(Color(.systemGray))
            
            Text(TimeIntervalGetFloatingMinuteClockString(secondsElapsed: splitInfo.timeTook))
                .font(.subheadline).bold()
            
        }
    }
}

struct TimerSplitView_Previews: PreviewProvider {
    static var previews: some View {
        TimerSplitView(splitInfo: SplitDisplayStruct(splitId: 0, splitName: "1-1", timeTook: 12))
    }
}
