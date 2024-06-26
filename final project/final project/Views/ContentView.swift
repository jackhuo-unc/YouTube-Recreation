//
//  ContentView.swift
//  final project
//
//  Created by Jack Huo on 4/17/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var isShowingModal = false
    var body: some View {
        NavigationStack {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage:"house.fill")
                    }
                ShortsView()
                    .tabItem {
                        Label("Shorts", systemImage: "play.rectangle.on.rectangle.circle.fill")
                    }
                RecordView()
                    .tabItem {
                        Image(systemName: "plus.circle")
                    }
                SubscriptionsView()
                    .tabItem {
                        Label("Subscriptions", systemImage: "play.square.stack")
                    }
                ProfileView()
                    .tabItem {
                        Label("You", systemImage: "circle")
                    }
            }
            .toolbar {
                ToolbarItem (placement: .navigationBarLeading){
                    Image(colorScheme == .dark ? "YouTube Logo Dark" : "YouTube Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                }
                ToolbarItem {
                    Button {
                        
                    } label: {
                        Image(systemName: "bell.badge")
                    }
                }
                ToolbarItem {
                    Button {
                        
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                }
            }
            .foregroundColor(.primary)
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
                self.isShowingModal = true
            }
        }
        .sheet(isPresented: $isShowingModal) {
            // Content of your popup modal
            PopupModal()
        }
    }
}



#Preview {
    ContentView()
}
