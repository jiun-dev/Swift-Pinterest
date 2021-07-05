//
//  TopButton.swift
//  Marvel
//
//  Created by shinjiun on 2021/07/05.
//

import SwiftUI

struct TopButton:View {
    @State var title: String
    @State var buttonCount: Int
    @Binding var buttonSelected: Int
    
    var body: some View{
        Button(action: {buttonSelected = buttonCount}){
            Text(title).foregroundColor(buttonSelected == self.buttonCount ? .white : .black).font(.system(size: 20,weight: .bold,design: .rounded))
        }.padding(.vertical,15).padding(.horizontal,10).background(buttonSelected == buttonCount ? Color.black : Color.white).cornerRadius(40)
    }
    
}

