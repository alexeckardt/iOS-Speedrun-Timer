//
//  TimeView.swift
//  iOS-Speedrun-Timer
//
//  Created by Anita Eckardt on 2023-01-06.
//

import SwiftUI

struct TimeView: View {
    
    let timeElapsed : TimeInterval;
    let percision : Int = 2;
    
    var body: some View {
        
        //Split Evenly
        HStack(alignment: .bottom, spacing: 0) {
            
            let timeStrings : [String] = TimeIntervalToTimerStringPercision(secondsElapsed: timeElapsed, percision: percision)
            
            //H Size Of Beggining
            VStack(alignment: .trailing) {
                Text(timeStrings[0])
                    .font(.largeTitle).multilineTextAlignment(.trailing).bold()
            }
            
            //V Size of Side
            VStack(alignment: .leading) {
                ZStack {
                    
                    //invisible buffer
                    let bufferStr = String(repeating: "0", count: percision)
                    Text(bufferStr)
                        .foregroundColor(.clear)
                    
                    //Actual Visible Time
                    Text(timeStrings[1])
                }
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .offset(y: -4)
            }

        }
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView(timeElapsed: 134423243.223)
    }
}
