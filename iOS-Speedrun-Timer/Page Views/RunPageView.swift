//
//  RunTimer.swift
//  iOS-Speedrun-Timer
//
//  Created by Anita Eckardt on 2023-01-06.
//

import SwiftUI

struct RunPageView: View {
    
    @Environment(\.presentationMode) var mode;
    
    //Detect App Close
    @Environment(\.scenePhase) var scenePhase
    @State private var isActive = true
    @State private var dateAppClosed : Date = Date();
    

    //Timer
    @State private var timerRunning = false;
    @State private var timeLastUpdated : Date = Date();
    @State private var storedTimerTime : TimeInterval = 0.0;
    @State private var timeStep = 0.01
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    //Splits
    @State private var splitsHit = 0;
    
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
        //Update Timer
        .onReceive(timer) { _ in
            
            TimerUpdate()
            
        }
        
        //Update If App Closes
        .onChange(of: scenePhase) { newPhase in
            
            TimerUpdateOnSceneUpdate(newPhase: newPhase)
            
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
            
            //Get the Time Elapsed
            TimeView(timeElapsed: storedTimerTime)
         
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
            ForEach(0 ... splitsHit, id: \.self) { i in
                
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
            
            //
            //THIS IS THE BIG BLUE BUTTON
            //
            splitButton
            
        }
        
    }
    
    
    var splitButton : some View {
        
        Button() {
            
            //Cause Split
            if (timerRunning) {
                
                SplitCreate()
                
            //Start Timer
            } else {
                
                TimerStart()
            
            }
            
        } label: {
            splitButtonLabel
        }
        
    }
    
    var splitButtonLabel : some View {
        
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
                
                if (timerRunning) {
                    
                    TimerPause()
                    
                }
                
            } label: {
                RunSmallButtonLabelView(buttonSize: buttonSize,
                                        buttonLabelImage: "pause",
                                        backgroundCol: timerRunning ? b : g)
            }
            
            //
            //
            //
            
            //Undo Split
            Button {
                
                SplitUndo();
                
            } label: {
                RunSmallButtonLabelView(buttonSize: buttonSize,
                                        buttonLabelImage: "arrow.uturn.backward",
                                        backgroundCol: (splitsHit > 0) ? b : g)
            }
            
            //
            //
            //
            
            Spacer()
            
            //Reset
            Button {
                
                TimerReset();
                
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

//
//
//
//      HELPER FUNCTIONS
//
//
//

extension RunPageView {
    
    func TimerStart() {
        timerRunning = true;
    }
    
    func TimerPause() {
        timerRunning = false;
    }
    
    func TimerReset() {
        //Stop The Time
        timerRunning = false;
        
        //Reset Stored Time
        storedTimerTime = 0.0;
        
        //Reset Hit Counter
        splitsHit = 0;
    }
    
    func TimerUpdate() {
        //Early Exit
        guard isActive else { return }
        
        //Update
        if (timerRunning) {
            storedTimerTime += timeStep
        }
    }
    
    func TimerUpdateOnSceneUpdate(newPhase: ScenePhase) {
        //App Opens
        if newPhase == .active {
            
            //Make Sure App Not Active
            if (!isActive) {
                
                //Toggle
                isActive = true
                
                //Print
                print("App Opened!")
                
                //Add Any Missing Time
                if (timerRunning) {
                    storedTimerTime += Date().timeIntervalSince(dateAppClosed)
                }
            }
            
        } else {
            
            //Make Sure Active
            if (isActive) {
                
                //Print
                print("App Closed!")
                
                //App Closes
                isActive = false
                dateAppClosed = Date()
            }
            
        }
    }
    
    func SplitCreate() {
        
        //Cause Split
        splitsHit += 1;
        
    }
    
    func SplitUndo() {
        
        if (splitsHit > 0) {
            splitsHit -= 1;
        }
        
    }
    
    func SplitsReset() {
        
        splitsHit = 0;
        
    }
    
}
