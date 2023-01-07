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
        
        HStack {
            
            Spacer()
            
            TimeView()
            
        }
        
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
