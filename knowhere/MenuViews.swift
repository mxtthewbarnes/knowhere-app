//
//  MenuViews.swift
//  knowhere
//
//  Created by Matthew Barnes on 7/5/25.
//
import SwiftUI

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
struct menuButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.custom("pacifico", size: 20))
                .foregroundColor(Color(.darkgreyslate))
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(10)
            
        }
    }
}

// Main menu implementation
struct mainMenu: View {
    @Binding var gameState: GameState
    var body: some View {
        VStack(spacing: 30) {
            Text("Knowhere")
                .font(.custom("pacifico", size: 50))
                .foregroundColor(.darkgreyslate)
                .padding(.top, 60)
            HStack(spacing: 10) {
                menuButton(title: "Play now") {
                    gameState = .playing
                }
                menuButton(title: "Scores") {
                    // TODO: Scores screen
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.white.ignoresSafeArea())
    }
}
