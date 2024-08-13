

import SwiftUI

struct ContentView: View {
    
    

    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {

            TabView {

                ApiList()
                    .tabItem {
                        Label("Compose", systemImage: "keyboard")
                    }
                MilkyWayView()
                    .tabItem {
                        Label("Info", systemImage:
                                "globe")
                    }
                SettingsView()
                    .tabItem {
                        Label("Setting", systemImage:
                        "gearshape.fill")
                    }
                InfoView()
                    .tabItem {
                        Label("Info", systemImage:
                        "questionmark.app.fill")
                    }
                WebView()
                    .tabItem {
                        Label(TabType.webview.title(), systemImage: "magnifyingglass.circle")
                
                    }
            }
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }

        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

