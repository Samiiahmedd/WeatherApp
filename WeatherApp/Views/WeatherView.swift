//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Sami Ahmed on 02/01/2024.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    var body: some View {
        ZStack(alignment:.leading){
            VStack{
                VStack(alignment:.leading,spacing: 5){
                    Text(weather.name)
                        .bold().font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                    
                }//VStack
                .frame(maxWidth: .infinity,alignment:.leading)
                Spacer()
                
                VStack{
                    HStack{
                        VStack(spacing:20){
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            Text(weather.weather[0].main)
                            
                        }//VStack
                        .frame(width: 150,alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }//HStack
                    Spacer()
                    .frame(height: 80)
                    VStack{
                        AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 350)
                        } placeholder: {
                            ProgressView()
                        }
                        Spacer()
                    }//VStack
                    .padding(.top,-30)
                    
                }//VStack
                .frame(maxWidth: .infinity)
                Spacer()
                
            }//VStack
            .padding()
            .frame(maxWidth: .infinity,alignment: .leading)
            
            VStack{
                Spacer()
                
                VStack(alignment:.leading,spacing: 20){
                    Text("Weather Now")
                        .bold().padding(.bottom)
                    
                    HStack{
                        weatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble()+"°"))
                        Spacer()
                        weatherRow(logo: "thermometer.sun", name: "Max temp", value: (weather.main.tempMax.roundDouble()+"°"))
                        Spacer()
                    }//HStack
                    
                    HStack{
                        weatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble()+"m/s"))
                        Spacer()
                        weatherRow(logo: "humidity", name: "humidity", value: (weather.main.humidity.roundDouble()+"%"))
                        Spacer()
                    }//HStack
                      
                }//VStack
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding()
                .padding(.bottom,20)
                .foregroundColor(Color(hue: 0.651, saturation: 0.902, brightness: 0.265))
                .background(.white)
                .cornerRadius(25, corners: [.topLeft,.topRight])
            }//VStack
            
        }//Zstack
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.651, saturation: 0.902, brightness: 0.265))
        .preferredColorScheme(.dark)
        
    }
}

#Preview {
    WeatherView(weather: ResponseBody(
        coord: ResponseBody.CoordinatesResponse(lon: 10.99, lat: 44.34),
        weather: [
            ResponseBody.WeatherResponse(id: 501, main: "Rain", description: "moderate rain", icon: "10d")
        ],
        main: ResponseBody.MainResponse(
            temp: 298.48,
            feels_like: 4,
            temp_min: 26,
            temp_max: 30.05,
            pressure: 105,
            humidity: 64
        ),
        name: "Damietta",
        wind: ResponseBody.WindResponse(speed: 0.62, deg: 349)
    ))
}

