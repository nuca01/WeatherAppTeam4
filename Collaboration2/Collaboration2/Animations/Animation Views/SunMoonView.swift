//
//  SunMoonView.swift
//  Collaboration2
//
//  Created by Akaki Titberidze on 12.06.24.
//

import SwiftUI

struct SunMoonView: View {
    var sun: Bool
    
    init(sun: Bool = true) {
        self.sun = sun
    }
    
    var body: some View {
        ZStack {
            HStack {
                VStack {
                    if sun {
                        Image("sun")
                            .padding(EdgeInsets(top: 80, leading: 8, bottom: 0, trailing: 0))
                    } else {
                        Image("moon")
                            .padding(EdgeInsets(top: 30, leading: 15, bottom: 0, trailing: 0))
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    SunMoonView()
}
