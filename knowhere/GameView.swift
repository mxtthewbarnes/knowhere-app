//
//  GameView.swift
//  knowhere
//
//  Created by Matthew Barnes on 7/5/25.
//
import SwiftUI
import SwiftEntryKit
import CoreLocation


// GameView
struct GameView: View {
    @Binding var gameState: GameState
    @Binding var actualCoordinate: CLLocationCoordinate2D?
    @Binding var totalScore: Int
    @Binding var mode: GameMode
    
    @State private var timeRemaining = 30
    @State private var timer: Timer?
    @State private var score = 0
    
    
    
    //nResults message built using Swift ENtry Kit
    func resultsPopup(miles: Double, roundScore: Int, totalScore: Int) {
        //theme color
        let darkSlateGrey = UIColor(red: 47/255, green: 79/255, blue: 79/255, alpha: 1.0)
        let hotOrange = UIColor(red: 1.0, green: 0.4, blue: 0.0, alpha: 1.0)
        
        let title = EKProperty.LabelContent(
            text: String(format: "Results", miles),
            style: .init(
                font: UIFont(name: "pacifico", size: 35) ?? .systemFont(ofSize: 25),
                color: EKColor(darkSlateGrey),
                alignment: .center
            )
        )
        
        
        let description = EKProperty.LabelContent(
            
            text: String(format: "You were %.2fmi away!\nScore this round: %dpts", miles, roundScore),
            style: .init(
                font: .systemFont(ofSize: 20),
                color: EKColor(darkSlateGrey),
                alignment: .center
            )
            
        )
        
        let buttonLabel = EKProperty.LabelContent(
            text: "Next Round",
            style: .init(
                font: .systemFont(ofSize: 18),
                color: EKColor(.white)
            )
        )
        
        
        //comment to push and test if sensitive data is detected by github - disregard comment
        let button = EKProperty.ButtonContent(
            label: buttonLabel,
            backgroundColor: (EKColor(hotOrange)),
            highlightedBackgroundColor: (EKColor(hotOrange).with(alpha: 0.9)),
            action: {
                SwiftEntryKit.dismiss()
            }
            
            
        )
        
        let popupMsg = EKPopUpMessage(
            title: title,
            description: description,
            button: button,
            action: {
                SwiftEntryKit.dismiss()
                self.actualCoordinate = generateRandomCoordinate(for: mode)
                self.gameState = .playing
            }
        )
        
        
        var attributes = EKAttributes.bottomFloat
        attributes.entryBackground = .color(color: .init(UIColor.white))
        attributes.displayDuration = .infinity
        attributes.entryInteraction = .absorbTouches
        attributes.screenInteraction = .forward
        attributes.roundCorners = .all(radius: 30)
        attributes.lifecycleEvents.didDisappear = {
            self.gameState = .playing
        }
        
        SwiftEntryKit.display(entry: EKPopUpMessageView(with: popupMsg), using: attributes)
    }
    
    //timer color change function
    private var timerColor: Color{
        if timeRemaining < 5
        {
            return .red
        }
        else if timeRemaining < 8
        {
            return .orange
        }
        else if timeRemaining < 15
        {
            return .yellow
        }
        else{
            return .white
        }
    }
    

    var body: some View {
        ZStack {
            ZStack {
                if let coord = actualCoordinate {
                    StreetViewPanorama(coordinate: coord)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .ignoresSafeArea()
                } else {
                    Color.black
                        .ignoresSafeArea()
                    Text("loading...")
                        .foregroundColor(.white)
                        .font(.custom("pacifico", size: 36))
                }
                
                VStack {
                    Spacer()
                    
                    HStack{
                        Spacer()
                        HStack(spacing: 5) {
                            Image(systemName: "clock.fill")
                                .foregroundColor(timerColor)
                            Text("\(timeRemaining)s")
                                .foregroundColor(timerColor)
                                .font(.headline)
                        }
                        .padding()
                    }
                    
                    ZStack {
                        // Toolbar background
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .frame(height: 90)
                            .ignoresSafeArea(edges: .bottom)
                            .cornerRadius(30)
                        
                        HStack(spacing: 20) {
                            Spacer()
                            
                            // Guess button
                            Button(action: {
                                gameState = .mapGuess
                            }) {
                                HStack(spacing: 8) {
                                    Text("Guess")
                                        .font(.custom("pacifico", size: 33))
                                        .foregroundColor(.white)
                                    Image(systemName: "mappin.and.ellipse.circle.fill")
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .cornerRadius(10)
                                
                            }
                            
                            Spacer()
                        }
                    }
                }
                
                .onAppear {
                    if actualCoordinate == nil {
                        if let box = boundingBox(for: mode) {
                            fetchStreetView(in: box) { coord in
                                DispatchQueue.main.async {
                                    self.actualCoordinate = coord
                                }
                            }
                        }
                    }
                    startTimer()
                }
                .onDisappear {
                    timer?.invalidate()
                }
            }
        }
    }
        func timerExpirePopup(totalScore: Int)
        {
            //initializing colors
            let darkSlateGrey = UIColor(red: 47/255, green: 79/255, blue: 79/255, alpha: 1.0)
            //let hotOrange = UIColor(red: 1.0, green: 0.4, blue: 0.0, alpha: 1.0)
            
            let title = EKProperty.LabelContent(
                text: String(format: "Sorry!"),
                style: .init(
                    font: UIFont(name: "pacifico", size: 25) ?? .systemFont(ofSize: 25),
                    color: EKColor(.black),
                    alignment: .center
                    
                )
            )
            
            let desc = EKProperty.LabelContent(
                
                text: String(format: "You ran out of time!\nScore: %d", totalScore),
                style: .init(
                    font: .systemFont(ofSize: 15),
                    color: EKColor(.black),
                    alignment: .center
                )
            )
            
            let buttonLabel = EKProperty.LabelContent(
                text: "Main Menu",
                style: .init(
                    font: .systemFont(ofSize: 15),
                    color: EKColor(.white)
                )
            )
            
            
            let button = EKProperty.ButtonContent(
                label: buttonLabel,
                backgroundColor: (EKColor(darkSlateGrey)),
                highlightedBackgroundColor: (EKColor(.white).with(alpha: 0.9)),
                action: {
                    SwiftEntryKit.dismiss()
                }
            )
            
            
            let popup = EKPopUpMessage(
                title: title,
                description: desc,
                button: button,
                action: {
                    SwiftEntryKit.dismiss()
                    self.gameState = .mainMenu
                }
            )
            
            var attributes = EKAttributes.centerFloat
            attributes.entryBackground = .color(color: .init(UIColor.white))
            attributes.displayDuration = .infinity
            attributes.entryInteraction = .absorbTouches
            attributes.screenInteraction = .absorbTouches
            attributes.roundCorners = .all(radius: 30)
            attributes.lifecycleEvents.didDisappear = {
                self.gameState = .mainMenu
            }
            SwiftEntryKit.display(entry: EKPopUpMessageView(with: popup), using: attributes)
        }
        private func startTimer() {
            timer?.invalidate()
            timeRemaining = 50
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                } else {
                    timerExpirePopup(totalScore: totalScore)
                    timer?.invalidate()
                    
                }
            }
        }
    }
    

