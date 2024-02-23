//
//  Popup.swift
//  blackjack
//
//  Created by Ayush Bheemaiah on 2/20/24.
//

import SwiftUI

struct Popup: View {
    @Binding var toggleActive: Bool
    let title: String
    let message: String
    let buttonTitle: String
    let action: () -> Void
    @State var offset: CGFloat = 2000
    var body: some View {
        ZStack {
            Color(.black)
                .opacity(0.5)
               
            
            VStack {
                Text(title)
                    .font(.title2)
                    .bold()
                    .padding()
                
                Text(message)
                    .font(.body)
                
                Button {
                    toggleActive = false
                    action()
                } label: {
                    ZStack {
                        
                        
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.red)
                        Text(buttonTitle)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                        
                    }
                    .padding()
                }
                
            }
            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay {
                VStack {
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            close()
                        } label: {
                            Image(systemName: "xmark")
                                .font(.title)
                                .fontWeight(.medium)
                        }
                    }
                    .tint(.black)
                    Spacer()
                }
                .padding()
                
            }
            .shadow(radius: 20)
            .padding(30)
            .offset(x: 0, y: offset)
            .onAppear() {
                withAnimation(.spring()) {
                    offset = 0
                }
            }
        }
        .ignoresSafeArea()
    }
    
    func close() {
        withAnimation(.spring()) {
            offset = 1000;
            toggleActive = false
        }
    }
}

#Preview {
    Popup(toggleActive: .constant(true), title: "You Lost!", message: "You exceeded 21!", buttonTitle: "Play Again!", action: {})
}
