//
//  ShadowLandscapeButtonView.swift
//  MiniApp87-Hackathon-Giikuten
//
//  Created by 前田航汰 on 2022/08/19.
//

import SwiftUI

struct ShadowLandscapeButtonView: View {
    @Binding var isPressed: Bool
    var displayName: String?
    var systemImageName: String?

    var body: some View {

        Button(action: {
            isPressed.toggle()
            print("tap buton")
        }) {
            HStack {
                if displayName == nil && systemImageName == nil {
                    Text("  ")
                } else if displayName == nil && systemImageName != nil {
                    Image(systemName: systemImageName!)
                } else if displayName != nil && systemImageName == nil {
                    Text(displayName!)
                        .font(.callout)
                } else {
                    Text(displayName!)
                        .font(.callout)
                    Image(systemName: systemImageName!)
                }
            }
        }
        .padding()
        .accentColor(Color.white)
        .background(Color.blue)
        .cornerRadius(26)
        .shadow(color: Color.blue, radius: 15, x: 0, y: 5)
        .scaleEffect(isPressed ? 0.9 : 1.0)
        .animation(.easeOut(duration: 1.0), value: isPressed)
        .padding()

    }
}

//struct ShadowLandscapeButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShadowLandscapeButtonView()
//    }
//}
