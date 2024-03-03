//
//  Home.swift
//  blackjack
//
//  Created by Ayush Bheemaiah on 2/19/24.
//

import SwiftUI

struct Home: View {
    
    @State var startActive = false
    var body: some View {
        NavigationView {
            
            ZStack {
                
                
                Image("background-cloth")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    
                    Image("logo")
                        .resizable()
                        .frame(width: 460, height: 460)
                    
                    NavigationLink (destination: Game()) {
                        Image ("start-button")
                            .resizable()
                            .frame(width: 300, height: 150)
                    
                    }
                    
                    NavigationLink (destination: Instructions()) {
                        Image ("information")
                            .resizable()
                            .frame(width: 40, height: 40)
                        
                        .padding()
                    
                    }
                
                }
            }
            
        }
        
        
    }
}

#Preview {
    Home()
}
