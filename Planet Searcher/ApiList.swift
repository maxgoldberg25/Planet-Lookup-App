//
//  ApiList.swift
//  Project3
//
//  Created by Max Goldberg on 12/10/22.
//

import SwiftUI

struct ApiList: View {
    
    @State var planets = [Planet]()
    @State var name: String = ""
    @State private var showingAlert = false
    @State private var animationAmount = 0.0
    
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
  
    }
    
    func getPlanet() {
        Api().loadData(name: self.name) { (planets) in
            self.planets = planets
        }
    }
    

    
    var body: some View {
        ZStack{
            Color.theme.background1
                .ignoresSafeArea()
                .opacity(0.25)
                    VStack(alignment: .leading) {
                       
                        VStack {
                            Button("Show Alert") {
                                        showingAlert = true
                                    }
                                    .alert(isPresented: $showingAlert) {
                                        Alert(title: Text("Please Note"), message: Text("Planets outside the Milky Way have limited data"), dismissButton: .default(Text("Got it!")))
                                    }
                            
                           
                            
                            TextField(
                                "Enter a planet:",
                                text: $name
                            )
                            .multilineTextAlignment(.center)
                            .font(Font.title.weight(.light))
                            .foregroundColor(Color.white)
                            .padding()
                            HStack {
                                Spacer()
                                
                                
        
                                Button("Get Info") {
                                    
                                  
                                        
                                    getPlanet()
                                    withAnimation {
                                        animationAmount += 360
                                }
                                }
                                .font(.title2)
                                .foregroundColor(Color.blue)
                                .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
                                
                                Spacer()
                            }
                        }
                       // .padding(15.0)
                        
                        
                        List {
                            ForEach(planets) { planet in
                                HStack {
                                  
                                   // Spacer()
                                    VStack(alignment: .trailing) {
                                        Text("Mass: \(planet.mass, specifier: "%.4f") Jupiters")
                                            .padding()
                                        Text("Radius: \(planet.radius, specifier: "%.5f") Jupiters")
                                            .padding()
                                        Text("Orbital Period: \(planet.period, specifier: "%.1f") orbital period in Earth days")
                                            .padding()
                                        Text("Semi-major Axis: \(planet.semi_major_axis, specifier: "%.1f") AUs")
                                            .padding()
                                        Text("Temperature: \(planet.temperature, specifier: "%d") Kelvin")
                                            .padding()
                                        Text("Distance: \(planet.distance_light_year, specifier: "%.1f") light years")
                                            .padding()
                                        Spacer()
                                    }
                                   // .minimumScaleFactor(0.01)
                                    .font(.system(size: 18.0))
                                }
                                .listRowBackground(Color.clear)
                                .foregroundColor(.white)
                                .padding()
                                
                            }
                        }
                        Spacer()
                    
                    }
                    
           
        }
        }
        
    }


struct ApiList_Previews: PreviewProvider {
    static var previews: some View {
        ApiList()
    }
}
