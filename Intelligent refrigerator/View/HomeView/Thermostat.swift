//
//  Thermostat.swift
//  Intelligent refrigerator
//
//  Created by cjj on 2021/3/4.
//

import SwiftUI




struct Thermostat:View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
        ZStack{
            Color.Neumorphic.main.ignoresSafeArea()
            VStack {
                ZStack {
                    HStack {
                        Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "house")
                            .imageScale(.large)
                    })
                        Spacer()
                        Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "slider.horizontal.3")
                            .imageScale(.large)
                    })
                    }
                    Text("实时画面")
                        .font(.title2)
                }
                .foregroundColor(.gray)
                .padding(.horizontal)
                Spacer()
                ZStack {
                    Rectangle()
                        .fill(Color.Neumorphic.main)
                        .frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/2, alignment: .center)
                        .softInnerShadow(Rectangle())
                    Rectangle()
                        .fill(Color.black.opacity(0.2))
                        .frame(width: UIScreen.main.bounds.width/2-30, height: 1, alignment: .center)
                    HStack {
                        VStack(spacing: 200.0){
                            VStack {
                                Text("冷藏室")
                                Text("4℃")
                            }
                            VStack {
                                Text("冷冻室")
                                Text("—6℃")
                            }
                        }
                        .font(.system(size: 34))
                        .padding(.horizontal, 60.0)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        VStack(spacing: 100.0){
                            ZStack(alignment:.bottom){
                                RoundedRectangle(cornerRadius: 20).fill(Color.Neumorphic.main).softOuterShadow().frame(width: 50, height: 160, alignment: .center)
                                RoundedRectangle(cornerRadius: 20).fill(Color.yellow).frame(width: 50, height: 120, alignment: .center)
                            }
                            ZStack(alignment:.bottom){
                                RoundedRectangle(cornerRadius: 20).fill(Color.Neumorphic.main).softOuterShadow().frame(width: 50, height: 160, alignment: .center)
                                RoundedRectangle(cornerRadius: 20).fill(Color.yellow).frame(width: 50, height: 120, alignment: .center)
                            }
                        }
                    }.padding(.horizontal, 30.0)
                }.frame(width: UIScreen.main.bounds.width/2, height: 600, alignment: .center)
                Spacer()
                ZStack {

                    HStack(spacing: 30.0){
                        CircleButton1(image: "假日", title: "假日", size: 60)
                        CircleButton1(image: "节能", title: "节能", size: 60)
                        CircleButton1(image: "速冻", title: "速冻", size: 60)
                        CircleButton1(image: "速冷", title: "速冷", size: 60)
                        CircleButton1(image: "智能", title: "智能", size: 60)
                        CircleButton1(image: "自定义", title: "自定义", size: 60)
                      
                        
                    }
                }
                Spacer()
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct CircleButton1:View {
    var image=""
    var title="接听"
    var size:CGFloat=60
    var body: some View{
        VStack(alignment: .center) {
            Button(action: {
            }, label: {
                VStack {
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .font(.system(size: 48))
                        .foregroundColor(Color.white.opacity(0.4))
                }.frame(width: size, height: size, alignment: .center)
            }).softButtonStyle(Circle())
            Text(title).foregroundColor(.gray)
        }
    }
}

struct Thermostat_Previews: PreviewProvider {
    static var previews: some View {
        Thermostat().preferredColorScheme(.light)
     
    }
}




// struct TestOffset: View {
//     @State var OneOffset: CGSize = .zero
//     @State var TwoOffset: CGSize = .zero
//     @State var Offsetheight = 0  //100为基础
//     var body: some View {
//         let Drag = DragGesture()
//             .onChanged { value in
//
//             self.OneOffset.height = value.translation.height
//             self.OneOffset.height+=TwoOffset.height
//             Offsetheight = Int(OneOffset.height)
//
//             }
//             .onEnded { _ in
//             self.TwoOffset.height = OneOffset.height
//             }
//
//         VStack {
//             Text("\(-Offsetheight / 20)")  //位移的值 0-5范围
//             Text("\(abs(OneOffset.height))")
//             ZStack(alignment: .bottom) {
//                 RoundedRectangle(cornerRadius: 25.0)
//                     .fill(Color.gray)
//                     .frame(width: 30, height: 200, alignment: .center)
//                 RoundedRectangle(cornerRadius: 25.0)
//                     .fill(Color.red)
//                     .frame(width: 30, height: 100 - CGFloat(Offsetheight), alignment: .center)
//                     .gesture(Drag)
//                     .disabled(abs(OneOffset.height)>110 ? true : false )
//                     .animation(.spring())
//
//             }
//         }
//     }
// }

//VStack {
//    ZStack(alignment: .center) {
//        Circle()
//            .fill(Color.Neumorphic.main)
//            .frame(width: 80, height: 80, alignment: .center)
//            .softOuterShadow()
//            VStack {
//                Image(image)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: size, height: size, alignment: .center)
//                    .foregroundColor(Color.white.opacity(0.4))
//
//            }
//    }
//    Text(title).foregroundColor(.gray)
//}
