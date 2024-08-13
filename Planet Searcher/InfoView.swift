//
//  InfoView.swift
//  Project3
//
//  Created by Max Goldberg on 12/10/22.
//


import SwiftUI

struct InfoView: View {
    @State private var isShowingLogo = true
    
   
    
    var body: some View {
        
        
        ZStack{
            Color.theme.background2
                .ignoresSafeArea()
                .opacity(0.3)
        VStack {
            Button("Tap Me to Hide/Reshow Logo"){
                withAnimation {
                    isShowingLogo.toggle()
                }
            }
            Spacer()
            if isShowingLogo {
                Image("planet")
                    .transition(.scale)
            
            }
            Text(Bundle.main.displayName ?? "")
                .font(.largeTitle)
                .fontWeight(.medium)
            Text(Bundle.main.version ?? "")
                .font(.title)
                .fontWeight(.medium)
            Text(Bundle.main.build ?? "")
                .font(.caption)
            Spacer()

            Text(Bundle.main.copyright ?? "")
                .font(.caption2)
                .padding()
        
       
        }
    }

}
}
