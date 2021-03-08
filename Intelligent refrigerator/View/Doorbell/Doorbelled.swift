//
//  Doorbelled.swift
//  Intelligent refrigerator
//
//  Created by cjj on 2021/3/4.
//

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
                            Image(systemName: "house")
                                .imageScale(.large)
                            Spacer()
                        }
                        Text("实时画面")
                            .font(.title2)
                    }
                    .foregroundColor(.white)
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
                        Color.gray.ignoresSafeArea(.all)
                        HStack(spacing: 30.0){
                                    ForEach(0..<3, id: \.self) { value  in
                                        CircleButton()
                                    }
                                }
                        .padding(.bottom, 30.0)
                    }
                    .padding(.top, -10)
       
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
            }.background(Color.gray.ignoresSafeArea())
    }
}

struct Doorbelled_Previews: PreviewProvider {
    static var previews: some View {
        Doorbelled()
    }
}
