//
//  Game.swift
//  blackjack
//
//  Created by Ayush Bheemaiah on 2/19/24.
//

import SwiftUI

struct Game: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    @State var numberOfWins = UserDefaults.standard.integer(forKey: "numberOfWins")
    @State var numberOfLosses = UserDefaults.standard.integer(forKey: "numberOfLosses")
    @State var dealerFirstNum = Int.random(in: 1...13)
    @State var dealerCardShown = "card"
    @State var dealerCardHidden = "back"
    @State var cardStack: [String] = ["card" + String(Int.random(in: 1...13)), "card" + String(Int.random(in: 1...13)), "back","back", "back", "back","back", "back"]
    @State var dealerScore = 0
    @State var playerScore = 0
    @State var count = 2;
    @State var cardCount: [Int] = []
    @State var isActive : Bool = false
    @State var navigateToHomeBool = false
    @State var gameOver = false
    @State var title = ""
    @State var message = ""
    
    var ratio: CGFloat =  227.7/157.2;
    
    
    
    var body: some View {
        
        GeometryReader { geometry in
            
            
            
            ZStack {
                
                
                
                Image("background-cloth")
                    .resizable()
                    .ignoresSafeArea()
                    .padding(0)
                    
                Spacer()
                       
                
                VStack {
                 
                    HStack {
                        Spacer()
                        Text("Wins: " + String(numberOfWins))
                            .frame(width: 100, height: 30)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .bold()
                            .background(.black)
                            .cornerRadius(25)
                       
                            
                        Image("logo")
                            .resizable()
                            .frame(width: 100, height: 100)
                                            
                        
                            
                        Text("Losses: " + String(numberOfLosses))
                            .frame(width: 100, height: 30)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .bold()
                            .background(.black)
                            .cornerRadius(25)
                           
                        Spacer()
                    }
                    
                    
                    Text("Dealer Sum: " + String(dealerScore))
                        .frame(width: 300, height: 50)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                        .background(.black)
                        .cornerRadius(25)
                        .padding(.bottom, 20)
                        
                    HStack {
                        let one = Int.random(in: 1...13)
                        Image(dealerCardShown + String(dealerFirstNum))
                            .resizable()
                            .frame(width: 110, height: 110 * ratio)
                        Image(dealerCardHidden)
                            .resizable()
                            .frame(width: 110, height: 110 * ratio)
                    }
                    Spacer()
                    Text("Player Sum: " + String(playerScore))
                        .frame(width: 300, height: 50)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                        .background(.black)
                        .cornerRadius(25)
                        .padding(20)
                        
                    let width = CGFloat(60)
                    let height = CGFloat(ratio * width)
                    
                    Spacer()
                    HStack {
                        Image(cardStack[0])
                            .resizable()
                            .frame(width: width, height: height)
                        Image(cardStack[1])
                            .resizable()
                            .frame(width: width, height: height)
                        Image(cardStack[2])
                            .resizable()
                            .frame(width: width, height: height)
                        Image(cardStack[3])
                            .resizable()
                            .frame(width: width, height: height)
                    
                                
                            
                        
                    }
                    
                    HStack {
                        Image(cardStack[4])
                            .resizable()
                            .frame(width: width, height: height)
                        Image(cardStack[5])
                            .resizable()
                            .frame(width: width, height: height)
                        Image(cardStack[6])
                            .resizable()
                            .frame(width: width, height: height)
                        Image(cardStack[7])
                            .resizable()
                            .frame(width: width, height: height)
                    }
                    
                    
                    Spacer()
                    HStack {
                        
                        Button {
                            if (gameOver == false) {
                                hit()
                            }
                        } label: {
                            
                            Text("Hit")
                                .frame(width: 120, height: 50)
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .bold()
                                .background(.black)
                                .cornerRadius(25)
                                .padding(.top, 20)
                            
                        }
                        
                        Button {
                            if (gameOver == false) {
                                stand()
                                
                            }
                        } label: {
                            Text("Stand")
                                .frame(width: 120, height: 50)
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .bold()
                                .background(.black)
                                .cornerRadius(25)
                                .padding(.top, 20)
                        }
                    }
                    Spacer()
                    
                }
                
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .fullScreenCover(isPresented: $navigateToHomeBool, content: {
                            Home() 
                        })
            Spacer()
            
            EmptyView()
                
                .onAppear {
                    
                    if gameOver == true {
                        isActive = true
                      
                    } else {
                      
                        
                    }
                }
                  
            
            if isActive {
              
                Popup(toggleActive: $isActive, title: title, message: message, buttonTitle: "Play Again!", action: { navigateToHome() })
                   
            }
        }
        .onAppear {
                initializePlayerAndDealerScore()
        }
    }
    
    func stand() {
        
        var rand = Int.random(in: 1...13)
        
        dealerCardHidden = "card" + String(rand);
        
        
        
        let sum = getSum()
        
        var firstCard = dealerFirstNum
        
        if (rand == 1 && firstCard != 1) {
            
            rand = 14
            
        } else if firstCard  == 1 {
            firstCard = 14
        }
        
       
     
        
        
        
        dealerScore = getValueFromCard("card" + String(firstCard)) + getValueFromCard("card" + String(rand))
        DispatchQueue.main.async {
                
                
                
                
                
            
                
                if sum > dealerScore {
                    gameOver = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                        numberOfWins += 1
                        UserDefaults.standard.set(numberOfWins, forKey: "numberOfWins")
                        title = "You Won!"
                        message = "The Dealer has a score of " + String(dealerScore) + " and you have a score of " + String(playerScore) + ". Your score is larger than the dealer! Click to Play Again."
                        
                        isActive = true
                    }
                } else if sum < dealerScore{
                    gameOver = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                        numberOfLosses += 1
                        UserDefaults.standard.set(numberOfLosses, forKey: "numberOfLosses")
                        title = "You Lost!"
                        message = "The Dealer has a score of " + String(dealerScore) + " and you have a score of " + String(playerScore) + ". Your score is lower than the dealer! Click to Play Again."
                      
                        isActive = true
                        
                    }
                } else {
                    gameOver = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                        numberOfLosses += 1;
                        UserDefaults.standard.set(numberOfLosses, forKey: "numberOfLosses")
                        title = "You Lost!"
                        message = "The Dealer has a score of " + String(dealerScore) + " and you have a score of " + String(playerScore) + ". Your score is the same as the dealer, meaning you lost! Click to Play Again."
                        gameOver = true
                        isActive = true
                        
                    }
                }
            }
    }
    
    func hit() {
        if (gameOver == false) {
            
            
            let rand = Int.random(in: 1...13)
            
            cardStack[count] = "card" + String(rand)
            count += 1;
            
            
            playerScore += getValueFromCard("card" + String(rand))
            
            let sum = getSum()
            
            DispatchQueue.main.async {
                
                if (playerScore > 21) {
                    gameOver = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.85) {
                        title = "You Lost!"
                        message = "You have a score of " + String(playerScore) + ". Unfortunately, you exceeded 21! Click to Play Again."
                        gameOver = true
                        isActive = true
                    }
                }
            }
        }
    }
    
    func getSum () -> Int {
        var sum = 0
        var aceCount = 0
        for string in cardStack {
            let intValue = getValueFromCard(string)
            if intValue == 1 {
              
                aceCount += 1;
            }
            sum += intValue;
            
        }
        
        if sum <= 11 && aceCount > 0 {
            sum += 10
        }
        return sum;
    }
    

    func initializePlayerAndDealerScore() {
       
        let sum = getSum()
        
        dealerScore = getValueFromCard("card" + String(dealerFirstNum))
        
        if (dealerScore == 1) {
            dealerScore = 11
        }
        playerScore = sum
    }
    
    func getValueFromCard(_ card: String) -> Int {
        
        let num = Int(card.suffix(card.count - 4))
            if num == 11 || num == 12 || num == 13 {
                
                    return 10
                }
        if (num == 14) {
            return 11
        }
            
        return num ?? 0
        
        
    }
    
    func dismiss() {
            presentationMode.wrappedValue.dismiss()
        }
    
    func navigateToHome() {
        
        isActive = false
        navigateToHomeBool = true
        
    }
}
#Preview {
    Game()
}
