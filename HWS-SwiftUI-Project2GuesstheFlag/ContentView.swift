//
//  ContentView.swift
//  HWS-SwiftUI-Project2GuesstheFlag
//
//  Created by Novan Agung Waskito on 05/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", " France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                .alert(scoreTitle, isPresented: $showingScore) {
                    Button("Continue", action: askQuestion)
                } message: {
                    Text("Your score is ???")
                }
        }
        VStack(spacing: 30) {
            VStack {
                
                Text ("Tap the flag of")
                    .font(.subheadline.weight(.heavy))
                    .foregroundColor(.white)
                Text (countries [correctAnswer])
                    .font(.largeTitle.weight(.semibold))
                    .foregroundColor(.white)
            }
        }
        ForEach (0..<3) { number in
            Button {
                //flag was tapped
                flagTapped(number)
            } label: {
                Image (countries [number])
                    .renderingMode(.original)
                    .clipShape(Capsule())
                    .shadow(radius: 5)
            }
        }
    }
    func flagTapped(_ number: Int){
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
        }
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
