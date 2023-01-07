//
//  TimeView.swift
//  iOS-Speedrun-Timer
//
//  Created by Anita Eckardt on 2023-01-06.
//

import SwiftUI

struct TimeView: View {
    var body: some View {
        
        HStack(alignment: .bottom, spacing: 0) {

            Text("0:00:00.0")
                .font(.largeTitle).multilineTextAlignment(.leading).bold()
            
            Text("00")
                .font(.subheadline)
                .offset(y: -5)
        }
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView()
    }
}
