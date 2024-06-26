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
                    BirdsView()
                    
                    Spacer()
                }
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearClearTopDay, .linearClearBottomDay]), startPoint: .top, endPoint: .bottom)
            )
        case "01n":
            ZStack {
                stars
                
                SunMoonView(sun: false)
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearClearTopNight, .linearClearBottomNight]), startPoint: .top, endPoint: .bottom)
            )
        case "02d":
            ZStack {
                SunMoonView()
                fullCloud
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearCloudyTopDay, .linearCloudyBottomDay]), startPoint: .top, endPoint: .bottom)
            )
        case "02n":
            ZStack {
                SunMoonView(sun: false)
                fullCloud
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearCloudyTopNight, .linearCloudyBottomNight]), startPoint: .top, endPoint: .bottom)
            )
        case "03d":
            ZStack {
                SunMoonView()
                fullCloud
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearCloudyTopDay, .linearCloudyBottomDay]), startPoint: .top, endPoint: .bottom)
            )
        case "03n":
            ZStack {
                SunMoonView(sun: false)
                fullCloud
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearCloudyTopNight, .linearCloudyBottomNight]), startPoint: .top, endPoint: .bottom)
            )
        case "04d":
            ZStack {
                SunMoonView()
                fullCloud
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearCloudyTopDay, .linearCloudyBottomDay]), startPoint: .top, endPoint: .bottom)
            )
        case "04n":
            ZStack {
                SunMoonView(sun: false)
                fullCloud
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearCloudyTopNight, .linearCloudyBottomNight]), startPoint: .top, endPoint: .bottom)
            )
        case "09d":
            ZStack {
                SunMoonView()
                rain
                halfCloud
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearRainTopDay, .linearRainBottomDay]), startPoint: .top, endPoint: .bottom)
            )
        case "09n":
            ZStack {
                SunMoonView(sun: false)
                rain
                halfCloud
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearRainTopNight, .linearRainBottomNight]), startPoint: .top, endPoint: .bottom)
            )
        case "10d":
            ZStack {
                SunMoonView()
                rain
                halfCloud
                SunMoonView()
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearRainTopDay, .linearRainBottomDay]), startPoint: .top, endPoint: .bottom)
            )
        case "10n":
            ZStack {
                SunMoonView(sun: false)
                rain
                halfCloud
                SunMoonView(sun: false)
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearRainTopNight, .linearRainBottomNight]), startPoint: .top, endPoint: .bottom)
            )
        case "11d":
            ZStack {
                SunMoonView()
                rain
                halfCloud
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearRainTopDay, .linearRainBottomDay]), startPoint: .top, endPoint: .bottom)
            )
        case "11n":
            ZStack {
                SunMoonView(sun: false)
                rain
                halfCloud
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearRainTopNight, .linearRainBottomNight]), startPoint: .top, endPoint: .bottom)
            )
        case "13d":
            ZStack {
                halfCloud
                SunMoonView()
                snow
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearSnowTopDay, .linearSnowBottomDay]), startPoint: .top, endPoint: .bottom)
            )
        case "13n":
            ZStack {
                halfCloud
                
                SunMoonView(sun: false)
                
                snow
                
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearSnowTopNight, .linearSnowBottomNight]), startPoint: .top, endPoint: .bottom)
            )
        case "50d":
            ZStack {
                SunMoonView()
                fullCloud
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.linearCloudyTopDay, .linearCloudyBottomDay]), startPoint: .top, endPoint: .bottom)
            )
        case "50n":
            ZStack {
                SunMoonView(sun: false)
                fullCloud
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
    
    //MARK: - fullCloud
    private var fullCloud: some View {
        ZStack {
            SpriteView(scene: SpriteAnimationView(anchorX: 0.5, anchorY: 0.5, fileName: "Cloud.sks"), options: [.allowsTransparency])
                .scaleEffect(1.5)
            
            SpriteView(scene: SpriteAnimationView(anchorX: 0.5, anchorY: 0.5, fileName: "Cloud2.sks"), options: [.allowsTransparency])
                .scaleEffect(1.5)
        }
    }
    
    //MARK: - halfCloud
    private var halfCloud: some View {
        ZStack {
            SpriteView(scene: SpriteAnimationView(anchorX: 0.5, anchorY: 1, fileName: "Cloud.sks"), options: [.allowsTransparency])
                .scaleEffect(1.5)
            
            SpriteView(scene: SpriteAnimationView(anchorX: 0.5, anchorY: 1, fileName: "Cloud2.sks"), options: [.allowsTransparency])
                .scaleEffect(1.5)
        }
    }
    
    //MARK: - stars
    private var stars: some View {
        SpriteView(scene: SpriteAnimationView(anchorX: 0.5, anchorY: 0.5, fileName: "Stars.sks"), options: [.allowsTransparency])
            .scaleEffect(2)
    }
    
    //MARK: - rain
    private var rain: some View {
        SpriteView(scene: SpriteAnimationView(anchorX: 1, anchorY: 1, fileName: "RainFall.sks"), options: [.allowsTransparency])
    }
    
    //MARK: - snow
    private var snow: some View {
        SpriteView(scene: SpriteAnimationView(anchorX: 0.5, anchorY: 1, fileName: "Snow.sks"), options: [.allowsTransparency])
            .scaleEffect(1.2)
    }
}

#Preview {
    AllAnimationView()
}
