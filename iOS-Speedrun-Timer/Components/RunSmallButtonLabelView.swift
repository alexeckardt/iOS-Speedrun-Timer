//
//  RunSmallButtons.swift
//  iOS-Speedrun-Timer
//
//  Created by Anita Eckardt on 2023-01-06.
//

import SwiftUI

struct RunSmallButtonLabelView: View {
    
    let buttonSize : CGFloat;
    let buttonLabelImage : String;
    let backgroundCol : Color;
    
    var body: some View {
        
        //Image
        Image(systemName: buttonLabelImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: buttonSize, height: buttonSize)
            .padding(buttonSize/2)
            .background(backgroundCol)
            .foregroundColor(Color(.systemBackground))
            .clipShape(Circle())
            .padding(.horizontal)
    }
}

struct RunSmallButtonLabelView_Previews: PreviewProvider {
    static var previews: some View {
        RunSmallButtonLabelView(buttonSize: 20, buttonLabelImage: "arrow", backgroundCol: Color(.systemBlue))
    }
}
