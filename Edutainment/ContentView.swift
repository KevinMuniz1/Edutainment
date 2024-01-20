//
//  ContentView.swift
//  Edutainment
//
//  Created by Kevin Muniz on 1/19/24.
//

import SwiftUI

struct ContentView: View {
    private var animalImage = ["bear", "giraffe","chick", "crocodile", "owl", "penguin", "zebra", "whale", "walrus", "snake", "sloth", "pig", "monkey"]
    private static var questions = [String]()
    @State private var animationAmount = 1.0
    @State private var appIsActive = false
    @State private var timesTables = 6
    @State private var questionAmount = 10
    @State private var score = 0
    @State private var userAnswer = 0
    var body: some View {
        if !appIsActive{
            Text("Edutainment")
                .font(.title).bold()
                .frame(maxWidth: .infinity)
                .background(.blue)
                .foregroundStyle(.white)
            VStack(){
                Image("bear")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .rotation3DEffect(.degrees(animationAmount),axis: (x: 0, y: 1, z: 0))
                    .animation(.bouncy(duration: 3.0), value: animationAmount)
                VStack(spacing: 25){
                    Text("Settings")
                        .font(.system(size: 30)).bold()
                        .foregroundStyle(.blue)
                    Stepper("Practice up to: \(timesTables) times tables", value: $timesTables, in: 2...12)
                        .font(.headline)
                        .padding()
                    Stepper("Question Count: \(questionAmount)", value: $questionAmount, in: 5...20, step: 5)
                        .font(.headline)
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
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .rotation3DEffect(.degrees(animationAmount),axis: (x: 0, y: 1, z: 0))
                    .animation(.bouncy(duration: 3.0), value: animationAmount)
                Spacer()
            }.onAppear {
                animationAmount = 360.0
            }
        } else {
            Text("Edutainment")
                .font(.title).bold()
                .frame(maxWidth: .infinity)
                .background(.blue)
                .foregroundStyle(.white)
            VStack{
                VStack{
                    VStack(spacing: 15){
                        Text("2 x 4")
                            .font(.system(size: 80)).bold()
                            .foregroundStyle(.blue)
                            .padding()
                        Text("Enter your answer:")
                            .font(.headline)
                            .padding()
                        HStack {
                                TextField("Answer", value: $userAnswer, formatter: NumberFormatter())
                                    .frame(width: 125, height: 50)
                                    .background(.blue)
                                    .foregroundStyle(.white)
                                    .font(.headline).multilineTextAlignment(.center)
                                    .clipShape(.rect(cornerRadius: 10))
                                    .keyboardType(.numberPad)
                                    .onSubmit {
                                        
                                    }
                            Button("Go"){
                                
                            }.frame(width: 50, height: 50)
                                .background(.blue)
                                .foregroundStyle(.white)
                                .clipShape(.rect(cornerRadius: 10))
                        }
                        Image(animalImage.randomElement() ?? "bear")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 125, height: 200, alignment: .bottomTrailing)
                    }
                    
                }.frame(width: 300, height: 500)
                    .background(.regularMaterial)
                    .background(.gray)
                    .clipShape(.rect(cornerRadius: 10))
                
                Text("Score: \(score)")
                    .font(.largeTitle).bold()
                    .foregroundStyle(.blue)
                    .padding()
                
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    ContentView()
}
