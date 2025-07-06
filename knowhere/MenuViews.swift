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
            font: UIFont.boldSystemFont(ofSize: 24),
            color: EKColor(.white),
            alignment: .center
        )
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
            color: EKColor(hotOrange),
            alignment: .center
        )
    )
    
    /*let float = EKPopUpMessage(
        title: title,
        description: desc
       
        
        )
    )*/
    
    var attributes = EKAttributes.bottomFloat
    attributes.entryBackground = .color(color: EKColor(hotOrange))
    attributes.roundCorners = .all(radius: 30)
    
    SwiftEntryKit.display(entry: EKNotificationMessageView(with: float), using: attributes)

    
    
    
}
