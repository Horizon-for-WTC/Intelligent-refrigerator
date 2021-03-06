//
//  Doorbell.swift
//  Intelligent refrigerator
//
//  Created by cjj on 2021/3/4.
//

import SwiftUI

struct Doorbell: View {
//    var arr=[]
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Color.gray.ignoresSafeArea()
                    VStack{
                        Spacer()
                        Text("有人在按门铃,等待接听...")
                        Image("cc")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                        Spacer()
                        HStack(spacing: 30.0){
                            ForEach(0..<3, id: \.self) { value  in
                                CircleButton()
                            }
                        }
                        .padding(.bottom, 30.0)
                    }
                }
                
            }
            .navigationBarTitle(Text("智能门铃"), displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "")
        }))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CircleButton:View {
    var image="phone.down.circle.fill"
    var title="接听"
    var size:CGFloat=100
    var body: some View{
        VStack {
            Image(systemName: image)
                .aspectRatio(contentMode: .fit)
                .font(.system(size: 60))
                
               
                .clipShape(Circle())
            Text(title)
        }
    }
}

struct Doorbell_Previews: PreviewProvider {
    static var previews: some View {
        Doorbell()
    }
}
