//
//  TimerView.swift
//  iOS-Speedrun-Timer
//
//  Created by Anita Eckardt on 2023-01-06.
//

import SwiftUI

struct TimerView: View {
    
    var body: some View {
        VStack {
            
            Divider()
            
            time
        }
    }
}

extension TimerView {
    var time : some View {
        
        HStack(alignment: .bottom, spacing: 0) {

            Spacer()
            
            Text("0:00:00.0")
                .font(.largeTitle).multilineTextAlignment(.leading).bold()
            
            Text("00")
                .font(.subheadline)
                .offset(y: -4)
        }
        
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
