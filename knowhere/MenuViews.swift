//
//  MenuViews.swift
//  knowhere
//
//  Created by Matthew Barnes on 7/5/25.
//
import SwiftUI
import SwiftEntryKit

// Initial loading screen
struct loadingScreen: View {
    var body: some View {
        ZStack {
            Color(.darkgreyslate)
                .ignoresSafeArea()
            VStack {
                Text("Knowhere")
                    .font(.custom("pacifico", size: 36))
                    .foregroundColor(.white)
                Image("icon")
            }
            .padding()
        }
    }
}

// Button styling for menu
struct MenuButton: View {
    let imageName: String
    let singleTapAction: () -> Void
    let doubleTapAction: () -> Void

    var body: some View {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .padding()
                .background(.darkgreyslate)
                .cornerRadius(30)
                .onTapGesture (count: 2){
                    doubleTapAction()
                }
                .onTapGesture (count: 1){
                    singleTapAction()
                    
                }
            
            
        }
    }




// Main menu implementation
struct MainMenu: View {
    @Binding var gameState: GameState
    @Binding var mode: GameMode

    var body: some View {
        VStack(spacing: 30) {
            Text("Knowhere")
                .font(.custom("pacifico", size: 50))
                .foregroundColor(.darkgreyslate)
                .padding(.top, 60)

            HStack(spacing: 10) {
                MenuButton(
                    imageName: "usa-proper",
                    singleTapAction: {
                        modeFloat(mode: .usa)
                        
                    },
                    doubleTapAction: {
                        mode = .usa
                        gameState = .playing
                    }
                )

                MenuButton(
                    imageName: "college",
                    singleTapAction: {
                        modeFloat(mode: .college)
                    },
                    doubleTapAction: {
                        mode = .college
                        gameState = .playing
                    }
                )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.white.ignoresSafeArea())
    }
}


//swift entry kit float message w/ highest score/round per gamemode
func modeFloat(mode: GameMode) {
    // initializing color
    let hotOrange = UIColor(red: 1.0, green: 0.4, blue: 0.0, alpha: 1.0)
    
    let title = EKProperty.LabelContent(
        text: {
            switch mode {
            case .usa:
                return "United States"
            case .college:
                return "College Campuses"
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
            SwiftEntryKit.dismiss()
        }
        )
    
    
    
    let desc = EKProperty.LabelContent(
        text: {
            switch mode {
            case .usa:
                return "Highest score: \(loadHighScore(for: .usa))\nDouble tap to play"
            case .college:
                return "Highest score: \(loadHighScore(for: .college))\nDouble tap to play"
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
            
        }
       
        
        )
    
    
    var attributes = EKAttributes.bottomFloat
    attributes.entryBackground = .color(color: EKColor(.darkgreyslate))
    attributes.roundCorners = .all(radius: 30)
    attributes.displayDuration = 3.0
    SwiftEntryKit.display(entry: EKPopUpMessageView(with: float), using: attributes)
    
    
}
