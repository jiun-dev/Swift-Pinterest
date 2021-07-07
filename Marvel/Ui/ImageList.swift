//
//  ImageList.swift
//  Marvel
//
//  Created by shinjiun on 2021/07/05.
//

import SwiftUI
import WaterfallGrid

struct ImageList: View {
    @State var buttonSelected = 0
    let buttons = ["one", "two", "three", "four"]
    @State private var cats = [CatModel]()

    
    
    var body: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false){
                HStack{
                    ForEach(0..<buttons.count){ button_count in
                        TopButton(title: buttons[button_count], buttonCount: button_count, buttonSelected: $buttonSelected)
                        
                    }
                }

                Button(action: {getCats()}, label: {
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                })
                
                WaterfallGrid((1...14), id:\.self){index in
                    Image("image_\(index)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(20)
                }.gridStyle(columns: 2).padding()
                
            }
        }.padding(.horizontal)
    }
}

struct ImageList_Previews: PreviewProvider {
    static var previews: some View {
        ImageList()
    }
}
