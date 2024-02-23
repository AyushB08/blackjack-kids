import SwiftUI

struct Instructions: View {
    var ratio: CGFloat =  227.7/157.2;
    var body: some View {
        ZStack {
            Image("background-cloth")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            ScrollView { 
                VStack {
                   
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Text("Tutorial")
                        .font(.system(size: 75, weight: .bold))
                        .padding()
                    
                    
                        Text("In this child-friendly game of blackjack, your objective is to get as close to 21 as possible without going over. The dealer starts with two cards, one face up and one face down, while you begin with two face-up cards. You have the options to \"hit\" for an extra card or \"stand\" to keep your current hand. Face cards are worth 10 points each, Aces can be 1 or 11 points, and number cards are valued accordingly. The dealer wins ties. Be mindful of your total score; exceeding 21 means you lose. With up to 8 cards available but typically only needing 2-4, strategize wisely. Enjoy the game!")
                            .padding()
                    
                    HStack {
                        Image("card11")
                            .resizable()
                            .frame(width: 100, height: 100*ratio)
                        Image("card12")
                            .resizable()
                            .frame(width: 100, height: 100*ratio)
                        Image("card13")
                            .resizable()
                            .frame(width: 100, height: 100*ratio)
                    }
                    
                    Text("Face Cards: Jack, Queen, King")
                    HStack {
                        
                        
                        Image("card2")
                            .resizable()
                            .frame(width: 100, height: 100*ratio)
                        Image("card3")
                            .resizable()
                            .frame(width: 100, height: 100*ratio)
                        Image("card4")
                            .resizable()
                            .frame(width: 100, height: 100*ratio)
                    }
                    Text("Number Cards: 2 - 10")
                    Image("card1")
                        .resizable()
                        .frame(width: 100, height: 100*ratio)
                    Text("Ace: Worth 1 or 11 points (depending on which benefits)")
                    Spacer()
                    
                    
                    
                }
               
                
                .foregroundColor(.white)
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
        }
    }
}

struct Instructions_Previews: PreviewProvider {
    static var previews: some View {
        Instructions()
    }
}
