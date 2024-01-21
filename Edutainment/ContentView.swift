//
//  ContentView.swift
//  Edutainment
//
//  Created by Kevin Muniz on 1/19/24.
//

import SwiftUI


func generateQuestions() -> [String] {
    var questions = [String]()
    for i in 2...12 {
        for j in 1...12 {
            questions.append("\(i) x \(j)")
        }
    }
    return questions
}

func generateAnswers() -> [String] {
    var answers = [String]()
    for i in 2...12 {
        for j in 1...12 {
            answers.append("\(i * j)")
        }
    }
    return answers
}

func checkAnswer(number: Int) {
    
    let question = generateQuestions()
    let answer = generateAnswers()
    
    
    
}



struct ContentView: View {
    @State private var animalImage = ["bear", "giraffe","chick", "crocodile", "owl", "penguin", "zebra", "whale", "walrus", "snake", "sloth", "pig", "monkey"]
    @State private var question = generateQuestions()
    @State private var animationAmount = 1.0
    @State private var appIsActive = false
    @State private var timesTables = 6
    @State private var questionAmount = 10
    @State private var score = 0
    @State private var userAnswer = 0
    var body: some View {
        if !appIsActive{
            VStack(){
                Text("Edutainment")
                    .font(.title).bold()
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .foregroundStyle(.white)
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
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                VStack{
                    VStack(spacing: 15){
                        Text(question[0])
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
                                checkAnswer(number: userAnswer)
                                question = question.shuffled()
                                withAnimation {
                                    animalImage = animalImage.shuffled()
                                }
                                userAnswer = 0
                            }.frame(width: 50, height: 50)
                                .background(.blue)
                                .foregroundStyle(.white)
                                .clipShape(.rect(cornerRadius: 10))
                        }
                        Image(animalImage[0])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 125, height: 200, alignment: .bottomTrailing)
                    }
                    
                }.frame(width: 300, height: 500)
                    .background(.regularMaterial)
                    .background(.gray)
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(50)
                
                Text("Score: \(score)")
                    .font(.largeTitle).bold()
                    .foregroundStyle(.blue)
                    .padding()
        }
    }
}

#Preview {
    ContentView()
}
