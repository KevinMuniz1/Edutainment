//
//  ContentView.swift
//  Edutainment
//
//  Created by Kevin Muniz on 1/19/24.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    @State private var appIsActive = false
    @State private var timesTables = 6
    @State private var questions = 10
    var body: some View {
        Text("Edutainment")
            .font(.title).bold()
            .frame(maxWidth: .infinity)
            .background(.blue)
            .foregroundStyle(.white)
        
        if !appIsActive{
            VStack(){
                Image("bear")
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding()
                    .rotation3DEffect(.degrees(animationAmount),axis: (x: 0, y: 1, z: 0))
                    .animation(.bouncy(duration: 3.0), value: animationAmount)
                VStack(spacing: 25){
                    Text("Settings")
                        .font(.system(size: 30)).bold()
                        .foregroundStyle(.blue)
                    Stepper("Select up to which time tables you would like to practice: \(timesTables)", value: $timesTables, in: 2...12)
                        .padding()
                    Stepper("How many questions would you like to answer? \(questions)", value: $questions, in: 5...20, step: 5)
                        .padding()
                    Button("Start Game"){
                        withAnimation {
                            appIsActive = true
                        }
                    }.frame(width: 125, height: 50)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .font(.headline)
                        .clipShape(.rect(cornerRadius: 10))
                }
                Image("giraffe")
                    .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                    .padding()
                    .rotation3DEffect(.degrees(animationAmount),axis: (x: 0, y: 1, z: 0))
                    .animation(.bouncy(duration: 3.0), value: animationAmount)
                Spacer()
            }.onAppear {
                animationAmount = 360.0
            }
        } else {
            
        }
             
    }
}

#Preview {
    ContentView()
}
