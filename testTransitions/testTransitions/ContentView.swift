//
//  ContentView.swift
//  testTransitions
//
//  Created by Roman Chervonyak on 20.12.2023.
//

import SwiftUI
import NavigationTransitions

struct ContentView: View {
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.steps) {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .padding()
                Button {
                    coordinator.showNextScreen(ScreenModel(title: "firstView", type: .firstView))
                } label: {
                    Text("show firstView")
                        .foregroundStyle(.white)
                }
                    
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background {
                Color.black
            }
            .ignoresSafeArea(.all)
            .navigationDestination(for: ScreenModel.self) { screen in
                switch screen.type {
                case .firstView:
                    FirstView()
                        .navigationTransition(.zoom)
                case .secondView:
                    SecondView()
                        .navigationTransition(.slide)
                case .thirdDView:
                    ThirdView()
                        .navigationTransition(.default)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct FirstView: View {
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .padding()
            Button {
                coordinator.showNextScreen(ScreenModel(title: "secondView", type: .secondView))
            } label: {
                Text("show secondView")
                    .foregroundStyle(.black)
            }
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(.all)
        .padding()
        .background {
            Color.white
        }
    }
}

struct SecondView: View {
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .padding()
            Button {
                coordinator.showNextScreen(ScreenModel(title: "secondView", type: .thirdDView))
            } label: {
                Text("show thirdView")
                    .foregroundStyle(.white)
            }
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(.all)
        .padding()
        .background {
            Color.red
        }
    }
}

struct ThirdView: View {
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .padding()
            Button {
                coordinator.popToRoot()
            } label: {
                Text("pop to root")
                    .foregroundStyle(.white)
            }
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(.all)
        .padding()
        .background {
            Color.pink
        }
    }
}

struct Zoom: NavigationTransition {
    var body: some NavigationTransition {
        MirrorPush {
            Scale(0.5)
            OnInsertion {
                ZPosition(1)
                Opacity()
            }
        }
    }
}

extension AnyNavigationTransition {
    static var zoom: Self {
        .init(Zoom())
    }
}
