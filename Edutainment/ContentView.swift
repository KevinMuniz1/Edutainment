//
//  ContentView.swift
//  Edutainment
//
//  Created by Kevin Muniz on 1/19/24.
//

import SwiftUI



struct ContentView: View {
    @State private var animalImage = ["bear", "giraffe","chick", "crocodile", "owl", "penguin", "zebra", "whale", "walrus", "snake", "sloth", "pig", "monkey"]
    @State private var questionsAndAnswer: [String : String] = [:]
    @State private var animationAmount = 1.0
    @State private var currentQuestion: String = ""
    private var correctAnswer: String {
        questionsAndAnswer[currentQuestion] ?? "0"
    }
    @State private var timesTables = 6
    @State private var questionAmount = 10
    @State private var questionsAnswered = 0
    @State private var score = 0
    @State private var userAnswer = ""
    @State private var appIsActive = false
    @State private var isGameOver = false
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
                        score = 0
                        questionsAnswered = 0
                        createQuestionAndAnswer(number: timesTables)
                        askQuestion()
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
                        Text(currentQuestion)
                            .font(.system(size: 80)).bold()
                            .foregroundStyle(.blue)
                            .padding()
                        Text("Enter your answer:")
                            .font(.headline)
                            .padding()
                        HStack {
                                TextField("Answer", text: $userAnswer)
                                .textFieldStyle(.roundedBorder)
                                    .padding(10)
                                    .font(.headline).multilineTextAlignment(.center)
                                    .clipShape(.rect(cornerRadius: 10))
                                    .keyboardType(.numberPad).ignoresSafeArea(.all)
                                    .onSubmit {
                                        
                                    }
                            Button("Go"){
                                checkAnswer(answer: userAnswer)
                                askQuestion()
                                withAnimation {
                                    animalImage = animalImage.shuffled()
                                }
                                userAnswer = ""
                            }.frame(width: 50, height: 50)
                                .background(.blue)
                                .foregroundStyle(.white)
                                .clipShape(.rect(cornerRadius: 10))
                        }
                        HStack {
                            Image(animalImage[0])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 125, height: 200, alignment: .bottomTrailing)
                            
                            Text("Score: \(score)")
                                .font(.largeTitle).bold()
                                .foregroundStyle(.blue)
                                .padding()
                                .offset(y: 50)
                        }
                    }
                    
                }.frame(width: 300, height: 500)
                    .background(.regularMaterial)
                    .background(.gray)
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(50)
                    .alert("Game Over", isPresented: $isGameOver) {
                        HStack {
                            Button("Restart") {
                                score = 0
                                questionsAnswered = 0
                                askQuestion()
                            }
                            
                            Button("Change Settings") {
                                questionsAndAnswer.removeAll()
                                print(questionsAndAnswer)
                                withAnimation {
                                    appIsActive = false
                                }
                            }
                        }
                    }message: {
                        Text("Your final score was \(score) out of \(questionAmount)")
                    }
        }
    }
    
    func createQuestionAndAnswer(number: Int) {
        for i in 2...number {
            for j in 1...12 {
                questionsAndAnswer["\(i) x \(j)"] = "\(i * j)"
            }
        }
        print(questionsAndAnswer)
    }
    
    
    func askQuestion() {
        if questionsAnswered >= questionAmount {
            isGameOver = true
            return
        } else {
            currentQuestion = questionsAndAnswer.keys.randomElement() ?? "None"
            questionsAnswered += 1
        }
    }
    
    func checkAnswer(answer: String) {
        if answer == correctAnswer {
                score += 1
        } else {
            print("wrong")
        }
    }


}

#Preview {
    ContentView()
}
