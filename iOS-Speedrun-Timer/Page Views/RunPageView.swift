//
//  RunTimer.swift
//  iOS-Speedrun-Timer
//
//  Created by Anita Eckardt on 2023-01-06.
//

import SwiftUI

struct RunPageView: View {
    
    @Environment(\.presentationMode) var mode;
    
    @State private var timerRunning = false;
    
    //Size
    private var buttonSize : CGFloat = 20;
    
    //Define Common Button Colours
    let g = Color(.systemGray)
    let b = Color(.systemBlue)
    
    
    
    var body: some View {
        ZStack {
            
            //Timer
            timeInfo
            
            footer
            
            //
            //Tap Gestures
            VStack {
                
                //header
                header
                
                //push to top
                Spacer()
            }
        }
    }
}

//
//
//
//
//

extension RunPageView {
    
    var header: some View {
        
        HStack {
            backButton
            Spacer()
        }
        
    }
    
    var backButton: some View {
        
        //Back Arrow Button
        Button {
            
            //Exit the Current Page, Return to previous view
            mode.wrappedValue.dismiss()
            
        } label: {
            //Image
            RunSmallButtonLabelView(buttonSize: buttonSize,
                                    buttonLabelImage: "arrow.left",
                                    backgroundCol: timerRunning ? g : b)
            
        }
        .padding(.leading)
        
        
    }
    
    //
    //
    //
    
    var timeInfo : some View {
        
        VStack {
            
            TimeView()
         
            ScrollView {
                splitInfo
            }
            .frame(height: 200)
            
        }
        
    }
    
    //
    //
    
    var splitInfo : some View {
        
        LazyVStack {
            //Go Over the Tabs
            ForEach(0 ... 50, id: \.self) { i in
                
                //Show the Milestone
                TimerSplitView()
                
            }
            
        }
    }
    
    //
    //
    //
    
    var footer : some View {
        
        //Stack
        VStack {
            
            //Push Down
            Spacer()
            
            //Other Action Buttons
            otherActions
            
            Divider()
            
            Button() {
                
                //Cause Split
                if (timerRunning) {
                    
                    //Set
                    timerRunning = true;
                
                    
                    
                //Start Timer
                } else {
                    
                    //Start Timer
                    timerRunning = true;
                }
                
            } label: {
                splitButton
            }
            
        }
        
    }

    var splitButton : some View {
        
        VStack {
            
            //Horizontal Space Full
            HStack { Spacer() }
            
            let buttonText = (timerRunning) ? "Tap To Split" : "Tap To Start Run"
            
            Text(buttonText)
                .fontWeight(.semibold).padding(.bottom, 5).foregroundColor(.white)

        }
        .frame(height: 160)
        .padding(.leading)
        .background(Color(.systemBlue))

    }
    
    //
    //
    //
    //
    
    var otherActions : some View {
        HStack {
            
            //Pause
            Button {
                
                //Stop The Time
                timerRunning = false;
                
            } label: {
                RunSmallButtonLabelView(buttonSize: buttonSize,
                                        buttonLabelImage: "pause",
                                        backgroundCol: timerRunning ? b : g)
            }
            
            //
            //
            //
            
            //Undo
            Button {
                
                //Stop The Time
                timerRunning = false;
                
            } label: {
                RunSmallButtonLabelView(buttonSize: buttonSize,
                                        buttonLabelImage: "arrow.uturn.backward",
                                        backgroundCol: timerRunning ? b : g)
            }
            
            //
            //
            //
            
            Spacer()
            
            //Reset
            Button {
                
                //Stop The Time
                timerRunning = false;
                
            } label: {
                RunSmallButtonLabelView(buttonSize: buttonSize,
                                        buttonLabelImage: "trash",
                                        backgroundCol: Color(.systemRed))
            }
            

        }
    }
}

//


struct RunPageView_Previews: PreviewProvider {
    static var previews: some View {
            RunPageView()
    }
}
