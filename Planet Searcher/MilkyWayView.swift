//
//  MilkyWayView.swift
//  Planet Searcher
//
//  Created by Max Goldberg on 12/11/22.
//

import SwiftUI

struct MilkyWayView: View {
    @State var planets = [Planet]()
    @State var name: String = ""
    
    func getPlanet() {
        Api().loadData(name: self.name) { (planets) in
            self.planets = planets
        }
    }
    
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
  
    }
    
    var body: some View {
        ZStack{
            Color.theme.background2
                .ignoresSafeArea()
                .opacity(0.25)
        VStack{
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 20) {
                
                Group{
                Text("Planets in Milky Way")
                    .font(.title)
                        
                    
                Text("Mercury")
                Image("Mercury")
                    .resizable()
                    .frame(width: 108.0, height: 108.0)
       
                    Button("Get info"){
                        name = "Mercury"
                           getPlanet()
                        
                    }
               
                    
                Text("Venus")
                Image("Venus")
                    .resizable()
                    .frame(width: 148.0, height: 118.0)
                
                Button("Get info"){
                    name = "Venus"
                       getPlanet()
                }

                
                
                
                Text("Earth")
                Image("Earth")
                    .resizable()
                    .frame(width: 108.0, height: 108.0)
                Button("Get info"){
                    name = "Earth"
                       getPlanet()
                }
                }
                Group{
                Text("Mars")
                Image("Mars")
                        .resizable()
                        .frame(width: 108.0, height: 108.0)
                    Button("Get info"){
                        name = "Mars"
                           getPlanet()
                    }
                Text("Jupiter")
                Image("Jupiter")
                        .resizable()
                        .frame(width: 108.0, height: 108.0)
                    Button("Get info"){
                        name = "Jupiter"
                           getPlanet()
                    }
                }
                Group{
                    Text("Saturn")
                    Image("Saturn")
                            .resizable()
                            .frame(width: 108.0, height: 108.0)
                        Button("Get info"){
                            name = "Saturn"
                               getPlanet()
                        }
                    Text("Uranus")
                    Image("Uranus")
                            .resizable()
                            .frame(width: 108.0, height: 108.0)
                        Button("Get info"){
                            name = "Uranus"
                               getPlanet()
                        }
                    Text("Neptune")
                    Image("Neptune")
                            .resizable()
                            .frame(width: 108.0, height: 108.0)
                        Button("Get info"){
                            name = "Neptune"
                               getPlanet()
                        }
                }
                
               
            
          
            }
        }
            Spacer()
            Text("Details of Planet:")
        List {
            ForEach(planets) { planet in
               
        Text("Mass: \(planet.mass, specifier: "%.1f") Jupiters")

        Text("Radius: \(planet.radius, specifier: "%.5f") Jupiters")
          
        Text("Orbital Period: \(planet.period, specifier: "%.1f") orbital period in Earth days")
          
        Text("Semi-major Axis: \(planet.semi_major_axis, specifier: "%.1f") AUs")
           
        Text("Temperature: \(planet.temperature, specifier: "%d") Kelvin")
            
        Text("Distance: \(planet.distance_light_year, specifier: "%.1f") light years")
         
        Spacer()
            }
            .font(.system(size: 18.0))
        
        .listRowBackground(Color.clear)
       // .foregroundColor(.black)
        .padding()
        }
    }
    }
    }
}

struct MilkyWayView_Previews: PreviewProvider {
    static var previews: some View {
        MilkyWayView()
    }
}
