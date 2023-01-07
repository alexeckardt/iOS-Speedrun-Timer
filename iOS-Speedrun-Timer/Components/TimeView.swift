//
//  TimeView.swift
//  iOS-Speedrun-Timer
//
//  Created by Anita Eckardt on 2023-01-06.
//

import SwiftUI

struct TimeView: View {
    
    let timeElapsed : TimeInterval;
    
    var body: some View {
        
        HStack(alignment: .bottom, spacing: 0) {

            let timeStrings : [String] = TimeIntervalToTimerString(secondsElapsed: timeElapsed)
            
            Text(timeStrings[0])
                .font(.largeTitle).multilineTextAlignment(.leading).bold()
            
            Text(timeStrings[1])
                .font(.subheadline)
                .offset(y: -5)
        }
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView(timeElapsed: Date().distance(to: Date()))
    }
}
