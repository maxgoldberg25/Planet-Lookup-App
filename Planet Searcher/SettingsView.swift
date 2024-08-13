

import SwiftUI
import MediaPlayer


struct SettingsView: View {
    let options = [".1",".2",".3",".4",".5",".6",".7",".8",".9","1.0"]


@AppStorage("isDarkMode") private var isDarkMode = false
@State private var showingOptions = false
    
@AppStorage("isMusicOn") private var isMusicOn = false
@AppStorage("notification") private var notification = false
@AppStorage("option") var option = ""

    

//let planets = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"]

//let options = ["1","2","3","4","5","6","7","8","9","10"]


    var body: some View {
        ZStack{
            Color.theme.background3
                .ignoresSafeArea()
                .opacity(0.3)
            
            VStack{
                Spacer()


                            Button("Dark Mode or Light Mode") {
                                showingOptions = true
                            }
                            .confirmationDialog("Select an option", isPresented: $showingOptions, titleVisibility: .visible) {
                                Button("Light Mode") {
                                    isDarkMode = false
                                }

                                Button("Dark Mode") {
                                    isDarkMode = true
                                }

                                
                            }
                Spacer()
                
                HStack {
                    Text("Background Music:")
                    Button("On"){
                        isMusicOn = true
                        MusicPlayer.shared.startBackgroundMusic()
                    }

                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    
                    .cornerRadius(40)
                    .padding(10)

  
                    Button("Off"){
                        MusicPlayer.shared.stopBackgroundMusic()
                        isMusicOn = false
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    
                    .cornerRadius(20)
                  
                }
                Spacer()
                Button("Request Permission") {
                        // first
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if success {
                            notification = true
                            print("All set!")
                        } else if let error = error {
                            print(error.localizedDescription)
                        }
                    }
                    }
              

                    Button("Schedule Notification") {
                        // second
                        let content = UNMutableNotificationContent()
                        content.title = "Search for a new planet now!"
                        content.subtitle = "There's always time to explore the universe"
                        content.sound = UNNotificationSound.default

                        // show this notification five seconds from now
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                        // choose a random identifier
                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                        // add our notification request
                        UNUserNotificationCenter.current().add(request)
                    }
                Spacer()
                Picker("Volume", selection: $option) {
                                ForEach(options, id: \.self) {
                                    Text($0)
                                }
                    
                            }
                            .pickerStyle(.menu)
                
                            Spacer()
                
//                Form {
//
//
//
//                    Section("Distance in Light Years") {
//                        HStack{
//                            Text("min")
//                            TextField("", text: $min_distance_light_year)
//                                .background(Color.init(red: 0.85098, green: 0.85098, blue: 0.85098))
//                                        .keyboardType(.decimalPad)
//                            Text("max")
//                            TextField("", text: $max_distance_light_year)
//                                .background(Color.init(red: 0.85098, green: 0.85098, blue: 0.85098))
//                                        .keyboardType(.decimalPad)
//                        }
//
//                    }
//
//                    Section("Mass of Planet in Jupiters") {
//                        HStack{
//                            Text("min")
//                            TextField("", text: $min_mass)
//                                .background(Color.init(red: 0.85098, green: 0.85098, blue: 0.85098))
//                                        .keyboardType(.decimalPad)
//                            Text("max")
//                            TextField("", text: $max_mass)
//                                .background(Color.init(red: 0.85098, green: 0.85098, blue: 0.85098))
//                                        .keyboardType(.decimalPad)
//                        }
//
//                    }
//
//                    Section("Radius of Planet in Jupiters") {
//                        HStack{
//                            Text("min")
//                            TextField("", text: $min_radius)
//                                .background(Color.init(red: 0.85098, green: 0.85098, blue: 0.85098))
//                                        .keyboardType(.decimalPad)
//                            Text("max")
//                            TextField("", text: $max_radius)
//                                .background(Color.init(red: 0.85098, green: 0.85098, blue: 0.85098))
//                                        .keyboardType(.decimalPad)
//                        }
//
//                    }
//
//                    Section("Temperature of Planet in Kelvin") {
//                        HStack{
//                            Text("min")
//                            TextField("", text: $min_temperature)
//                                .background(Color.init(red: 0.85098, green: 0.85098, blue: 0.85098))
//                                        .keyboardType(.decimalPad)
//                            Text("max")
//                            TextField("", text: $max_temperature)
//                                .background(Color.init(red: 0.85098, green: 0.85098, blue: 0.85098))
//                                        .keyboardType(.decimalPad)
//                        }
//
//                    }
//
//
//
//            }
//                .onTapGesture {
//                    hidekeyboard()
//                }
                        }
            
            
            
            }
            
            
        }
        

    
}
    class NumbersOnly: ObservableObject {
        @Published var value = "" {
            didSet {
                let filtered = value.filter { $0.isNumber }
                
                if value != filtered {
                    value = filtered
                }
            }
        }
    }



struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension View{
    func hidekeyboard(){
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
//Update system volume
extension MPVolumeView {
    static func setVolume(_ volume: Float) {
        let volumeView = MPVolumeView()
        let slider = volumeView.subviews.first(where: { $0 is UISlider }) as? UISlider

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01) {
            slider?.value = volume
        }
    }
}
