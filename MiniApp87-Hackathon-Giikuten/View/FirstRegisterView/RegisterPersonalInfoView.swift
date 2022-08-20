//
//  RegisterPersonalInfoView.swift
//  MiniApp87-Hackathon-Giikuten
//
//  Created by 前田航汰 on 2022/08/20.
//

import SwiftUI

struct RegisterPersonalInfoView: View {
    @State private var name: String = ""

    var body: some View {
        TextField("タイトル", text: $name)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        Button("aaa") {
        }
    }
}

struct RegisterPersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPersonalInfoView()
    }
}
