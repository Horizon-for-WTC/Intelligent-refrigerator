//
//  Doorbelled.swift
//  Intelligent refrigerator
//
//  Created by cjj on 2021/3/4.
//video.fill   phone.down.fill     camera

import SwiftUI

struct Doorbelled: View {
//    var arr=[]
    @State var isshowmessage=false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
            ZStack {
                VStack{
                    ZStack {
                        HStack {
                            Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "house")
                                .imageScale(.large)
                        })
                            Spacer()
                        }
                        Text("实时画面")
                            .font(.title2)
                    }
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    ZStack(alignment: .top){
                        Image("perch")
                            .frame(width: UIScreen.main.bounds.width, height: 800)
                            .background(Color.black)
                        HStack{
                            Spacer()
                            Text("2020/10/12 00:22:45")
                                .foregroundColor(.white)
                                .padding([.top, .trailing])
                        }
                    }
                    Spacer()
                    ZStack {
                        HStack(spacing: 100.0){
//                                    ForEach(0..<3, id: \.self) { value  in
//                                        CircleButton()
//                                    }
                            CircleButton(image: "video.fill", title: "录制", size: 60)
                            CircleButton(image: "phone.down.fill", title: "挂断", size: 60)
                            CircleButton(image: "camera", title: "拍摄", size: 60)
                                }
                        .padding(.bottom, 60.0)
                    }
                }
                .blur(radius: isshowmessage ? 5 : 0)
                .navigationBarTitle(Text("智能门铃"), displayMode: .inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: Button(action: {}, label: {
                    Image(systemName: "")
            }))
                if isshowmessage{
                    Doorbellmessage()
                }
            }.background(Color.Neumorphic.main.ignoresSafeArea())
    }
}

struct Doorbelled_Previews: PreviewProvider {
    static var previews: some View {
        Doorbelled()
    }
}
