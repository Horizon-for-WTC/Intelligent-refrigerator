//
//  NumberPhone.swift
//  Intelligent refrigerator
//
//  Created by cjj on 2021/3/4.
//

import SwiftUI

struct NumberPhone: View {
    @Environment(\.presentationMode) var presentationMode
    @State var textphone=[1:"",2:"ABC",3:"DEF",4:"GHI",5:"JKL",6:"MNO",7:"PQR",8:"STUYZ",9:"WXYZ","*":"",0:"","#":""]
    let columns=[GridItem(.adaptive(minimum: UIScreen.main.bounds.width/4))]
    var body: some View {
        let keys = textphone.map{$0.key}
        let values = textphone.map {$0.value}
        VStack {
            ZStack {
                HStack{
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "house")
                    })
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "slider.horizontal.3")
                    })
                }.padding(.horizontal)
                Text("电话")
            }.foregroundColor(.white)
            Spacer()
            HStack {
                LazyVGrid (columns: columns) {
                    ForEach(keys.indices){ value in
                        NumberBut(topnum: "\(keys[value])", butoomnum: "\(values[value])").padding()
                    }
                }
            }
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "phone.fill")
                    .font(.system(size: 68))
                    .foregroundColor(.white)
            })
            .frame(width: 100, height: 100, alignment: .center)
            .background(Color.white.opacity(0.3))
            .clipShape(Circle())
        }.background(Color.gray.ignoresSafeArea())
    }
}

struct NumberBut:View {
    var  topnum = "1"
    var butoomnum="ABC"
    
    var body: some View{
        VStack{
            Button(action: {}, label: {
                VStack {
                    Text(topnum)
                        .font(.system(size: 48))
                    Text(butoomnum)
                }
               
            }).foregroundColor(.black)
        }
    }
}
struct NumberPhone_Previews: PreviewProvider {
    static var previews: some View {
        NumberPhone()
    }
}
