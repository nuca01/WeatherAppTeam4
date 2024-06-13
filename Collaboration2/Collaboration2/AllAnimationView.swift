//
//  AllAnimationView.swift
//  Collaboration2
//
//  Created by Akaki Titberidze on 12.06.24.
//


//01d sun + birds
//01n moon + stars
//02d sun + clouds(full)
//02n moon + clouds(full)
//03d clouds(full)
//03n clouds(full)
//04d clouds(full)
//04n clouds(full)
//09d clouds(half) + rain
//09n clouds(half) + rain
//10d sun + clouds(half) + rain
//10n moon + clouds(half) + rain
//11d clouds(half) + rain + thunder
//11n clouds(half) + rain + thunder
//13d snow + clouds
//13n snow + clouds
//50n clouds(full)
//50d clouds(full)

import SwiftUI
import _SpriteKit_SwiftUI

struct AllAnimationView: View {
    var weather: String
    
    init(weather: String = "13n") {
        self.weather = weather
    }
    
    var body: some View {
        switch weather {
        case "01d":
            ZStack {
                SunMoonView()
                VStack {
                    Birds()
                    
                    Spacer()
                }
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearClearTopDay, .linearClearBottomDay]), startPoint: .top, endPoint: .bottom)
            )
        case "01n":
            ZStack {
                SpriteView(scene: StarsView(), options: [.allowsTransparency])
                    .scaleEffect(2)
                
                SunMoonView(sun: false)
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearClearTopNight, .linearClearBottomNight]), startPoint: .top, endPoint: .bottom)
            )
        case "02d":
            ZStack {
                SunMoonView()
                CloudAnimationView()
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearCloudyTopDay, .linearCloudyBottomDay]), startPoint: .top, endPoint: .bottom)
            )
        case "02n":
            ZStack {
                SunMoonView(sun: false)
                CloudAnimationView()
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearCloudyTopNight, .linearCloudyBottomNight]), startPoint: .top, endPoint: .bottom)
            )
        case "03d":
            ZStack {
                CloudAnimationView()
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearCloudyTopDay, .linearCloudyBottomDay]), startPoint: .top, endPoint: .bottom)
            )
        case "03n":
            ZStack {
                CloudAnimationView()
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearCloudyTopNight, .linearCloudyBottomNight]), startPoint: .top, endPoint: .bottom)
            )
        case "04d":
            ZStack {
                CloudAnimationView()
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearCloudyTopDay, .linearCloudyBottomDay]), startPoint: .top, endPoint: .bottom)
            )
        case "04n":
            ZStack {
                CloudAnimationView()
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearCloudyTopNight, .linearCloudyBottomNight]), startPoint: .top, endPoint: .bottom)
            )
        case "09d":
            ZStack {
                SpriteView(scene: RainView(), options: [.allowsTransparency])
                CloudAnimationView(cloudSetHalf: true)
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearRainTopDay, .linearRainBottomDay]), startPoint: .top, endPoint: .bottom)
            )
        case "09n":
            ZStack {
                SpriteView(scene: RainView(), options: [.allowsTransparency])
                CloudAnimationView(cloudSetHalf: true)
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearRainTopNight, .linearRainBottomNight]), startPoint: .top, endPoint: .bottom)
            )
        case "10d":
            ZStack {
                SpriteView(scene: RainView(), options: [.allowsTransparency])
                CloudAnimationView(cloudSetHalf: true)
                SunMoonView()
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearRainTopDay, .linearRainBottomDay]), startPoint: .top, endPoint: .bottom)
            )
        case "10n":
            ZStack {
                SpriteView(scene: RainView(), options: [.allowsTransparency])
                CloudAnimationView(cloudSetHalf: true)
                SunMoonView(sun: false)
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearRainTopNight, .linearRainBottomNight]), startPoint: .top, endPoint: .bottom)
            )
        case "11d":
            ZStack {
                SpriteView(scene: RainView(), options: [.allowsTransparency])
                CloudAnimationView(cloudSetHalf: true)
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearRainTopDay, .linearRainBottomDay]), startPoint: .top, endPoint: .bottom)
            )
        case "11n":
            ZStack {
                SpriteView(scene: RainView(), options: [.allowsTransparency])
                CloudAnimationView(cloudSetHalf: true)
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearRainTopNight, .linearRainBottomNight]), startPoint: .top, endPoint: .bottom)
            )
        case "13d":
            ZStack {
                CloudAnimationView(cloudSetHalf: true)
                SunMoonView()
                
                SpriteView(scene: SnowView(), options: [.allowsTransparency])
                    .scaleEffect(1.2)
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearSnowTopDay, .linearSnowBottomDay]), startPoint: .top, endPoint: .bottom)
            )
        case "13n":
            ZStack {
                CloudAnimationView(cloudSetHalf: true)
                
                SunMoonView(sun: false)
                
                SpriteView(scene: SnowView(), options: [.allowsTransparency])
                    .scaleEffect(1.2)
                
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearSnowTopNight, .linearSnowBottomNight]), startPoint: .top, endPoint: .bottom)
            )
        case "50d":
            ZStack {
                CloudAnimationView()
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearCloudyTopDay, .linearCloudyBottomDay]), startPoint: .top, endPoint: .bottom)
            )
        case "50n":
            ZStack {
                CloudAnimationView()
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearCloudyTopNight, .linearCloudyBottomNight]), startPoint: .top, endPoint: .bottom)
            )
            
            
        default:
            ZStack {}
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearClearTopDay, .linearClearBottomDay]), startPoint: .top, endPoint: .bottom)
            )
        }
    }
}

#Preview {
    AllAnimationView()
}
