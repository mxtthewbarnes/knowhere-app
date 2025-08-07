//
//  MenuViews.swift
//  knowhere
//
//  Created by Matthew Barnes on 7/5/25.
//
import SwiftUI
import SwiftEntryKit
import CoreLocation
import UIKit

// Initial loading screen
struct loadingScreen: View {
    var body: some View {
        ZStack {
            Color(.darkgreyslate)
                .ignoresSafeArea()
            VStack {
                Text("Knowhere!")
                    .font(.custom("pacifico", size: 36))
                    .foregroundColor(.white)
                
            }
            .padding()
        }
    }
}





extension GameMode{
    var displayName: String{
        switch self{
        case .usa: return "USA"
        case .europe: return "Europe"
        case .world: return "Earth"
        case .college: return "College Campuses"
        }
    }
}

struct MenuButton: View{
    @State private var isPressed = false
    let imageName: String
    let highScore: Int
    let doubleTapAction: () -> Void
    let mode: GameMode
    let hotOrange = UIColor(red: 1.0, green: 0.4, blue: 0.0, alpha: 1.0)
    
    
    var body: some View{
        ZStack{
            if isPressed{
                VStack{
                    Text(mode.displayName).font(.custom("pacifico", size: 25))
                    Text("Highscore: \(highScore)")
                        .font(.system(size: 10))
                    Text("Double tap to play")
                        .font(.system(size:10))
                }
                .padding()
                .frame(width: 150, height: 150)
                .background(Color(hotOrange))
                .cornerRadius(30)
                .multilineTextAlignment(.center)
                
            } else{
                ZStack{
                    Color.darkgreyslate
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .cornerRadius(30)
                        .padding(20)
                }
                .frame(width: 150, height: 150)
                .cornerRadius(30)
            }
        }
        .onTapGesture {
            UIImpactFeedbackGenerator(style: .soft).impactOccurred()
            withAnimation(.spring())
            {
                isPressed.toggle()
            }
        }
        
        .onTapGesture(count: 2) {
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
            doubleTapAction()
        }
    }
}
    
    
    // Main menu implementation
    struct MainMenu: View {
        @Binding var gameState: GameState
        @Binding var mode: GameMode
        @Binding var actualCoordinate: CLLocationCoordinate2D?
        let allLocations: [GameMode: [StreetViewLocation]]
        
        var body: some View {
            VStack(spacing: 10) {
                Text("Knowhere!")
                    .font(.custom("pacifico", size: 50))
                    .foregroundColor(.darkgreyslate)
                    .padding(.top, 60)
                
                HStack(spacing: 10) {
                    MenuButton(imageName: "world",
                               highScore: loadHighScore(for: .world),
                               doubleTapAction: {
                        mode = .world
                        gameState = .playing
                    },
                               mode: .world
                               
                    )
                    
                    
                    
                    MenuButton(
                        imageName: "usa-proper",
                        highScore: loadHighScore(for: .usa),
                        doubleTapAction: {
                            mode = .usa
                            gameState = .playing
                        },
                        mode: .usa
                    )
                    
                    
                    
                    
                }
                HStack(spacing: 10) {
                    MenuButton(imageName: "europe",
                               highScore: loadHighScore(for: .europe),
                               doubleTapAction: {
                        mode = .europe
                        gameState = .playing
                    },
                               mode: .europe
                    )
                    
                    MenuButton(
                        imageName: "college",
                        highScore: loadHighScore(for: .college),
                        
                        doubleTapAction: {
                            mode = .college
                            self.actualCoordinate = generateRandomCoordinate(for: .college, locations: allLocations)
                            gameState = .playing
                        },
                        mode: .college
                    )
                }
                
            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .cornerRadius(30)
            .background(Color.white.ignoresSafeArea())
        }
    }

    
    
    /* SWIFTENTRYKIT IMPLEMENATION - MAY BE REMOVED
     
     
    //swift entry kit float message w/ highest score/round per gamemode
    func modeFloat(mode: GameMode, onPlay: @escaping ()-> Void) {
        // initializing color
        let hotOrange = UIColor(red: 1.0, green: 0.4, blue: 0.0, alpha: 1.0)
        
        let title = EKProperty.LabelContent(
            text: {
                switch mode {
                case .usa:
                    return "United States"
                case .college:
                    return "College Campuses"
                case .europe:
                    return "Europe"
                case .world:
                    return "World"
                }
            }(),
            style: EKProperty.LabelStyle(
                font: UIFont(name: "pacifico", size: 15) ?? .systemFont(ofSize: 25),
                color: EKColor(.white),
                alignment: .left
            )
        )
        
        
        let buttonLabel = EKProperty.LabelContent(
            text: "Play Now",
            style: EKProperty.LabelStyle(
                font: UIFont.systemFont(ofSize: 18),
                color: EKColor(.white)
            )
        )
        
        let button = EKProperty.ButtonContent(
            label: buttonLabel,
            backgroundColor: EKColor(hotOrange),
            highlightedBackgroundColor:  (EKColor(hotOrange).with(alpha: 0.9)),
            action: {
                onPlay()
            }
        )
        
        
        
        let desc = EKProperty.LabelContent(
            text: {
                switch mode {
                case .usa:
                    return "Highest score: \(loadHighScore(for: .usa))\nDouble tap to play"
                case .college:
                    return "Highest score: \(loadHighScore(for: .college))\nDouble tap to play"
                case .europe:
                    return "Highest score: \(loadHighScore(for: .europe))"
                case .world:
                    return "Highest score: \(loadHighScore(for: .world))"
                }
            }(),
            style: .init(
                font: .systemFont(ofSize: 15),
                color: EKColor(.white),
                alignment: .center
            )
        )
        
        
        let float = EKPopUpMessage(
            title: title,
            description: desc,
            button: button,
            action: {
                SwiftEntryKit.dismiss()
                onPlay()
                
            }
            
            
        )
        
        
        var attributes = EKAttributes.bottomFloat
        attributes.entryBackground = .color(color: EKColor(.darkgreyslate))
        attributes.roundCorners = .all(radius: 30)
        attributes.displayDuration = 3.0
        SwiftEntryKit.display(entry: EKPopUpMessageView(with: float), using: attributes)
        
        
    }

*/
