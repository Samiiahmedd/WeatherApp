//
//  ContentView.swift
//  WeatherApp
//
//  Created by Sami Ahmed on 02/01/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            if let location = locationManager.location{
                if let weather = weather{
                    WeatherView(weather:weather)
                }else{
                    LoadingView()
                        .task {
                            do{
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            }catch{
                                print("error while getting weather: \(error)")
                                
                            }
                        }
                }
                
            }else{
                if locationManager.isLoading{
                    LoadingView()
                }else{
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
            
        }//VStack
        .background(Color(hue: 0.651, saturation: 0.902, brightness: 0.265))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
