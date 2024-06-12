//
//  WeatherPageView.swift
//  Collaboration2
//
//  Created by nuca on 11.06.24.
//

import SwiftUI
import SpriteKit

struct WeatherPageView: View {
    @ObservedObject var viewModel: WeatherPageViewModel
    @State var city: City?
    
    var body: some View {
        ZStack{
                   
                   SpriteView(scene: StarsView(), options: [.allowsTransparency])
                   
//                   SpriteView(scene: RainView(), options: [.allowsTransparency])
            
//            SpriteView(scene: SnowView(), options: [.allowsTransparency])
                   
                   ScrollView{
                       DailyWeatherView(viewModel: viewModel)
//                       Text("Hello, World!")
                   }
               }
        .background(Color.gray)
        
    }
    
    init(viewModel: WeatherPageViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    WeatherPageView(viewModel: WeatherPageViewModel())
}
