//
//  NoteDetail.swift
//  Intelligent refrigerator
//
//  Created by 陈佳俊 on 2021/3/23.
//

import SwiftUI

struct NoteDetail: View {
    @State var cjjvalue:Notes
    @Environment(\.managedObjectContext) var moc
    var myDateFormatter: DateFormatter  // 日期格式
    {
        let formatter = DateFormatter()
        formatter.dateFormat="YYYY-MM-dd HH:mm"
        return formatter
    }
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.Neumorphic.main)
                .frame(width: UIScreen.main.bounds.width/2-40, height: 100, alignment: .center)
                .softOuterShadow()
               
            HStack(alignment: .top){
                VStack {
                    Image("1")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                    Spacer()
                }.padding()
                VStack(alignment: .leading, spacing: 8.0){
                    HStack {
                        Text("\(cjjvalue.name)")
                        Spacer()
                    }
                    Text("\(cjjvalue.content)")
                    Text("\(cjjvalue.date,formatter: myDateFormatter)")
                }
                .foregroundColor(Color.gray)
                .padding(.vertical)
                Spacer()
            }
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        moc.delete(cjjvalue)
                        do{
                           try moc.save()
                        }catch{
                            print(error.localizedDescription)
                        }
                      
                    }, label: {
                        Image(systemName: "trash.circle.fill")
                            .font(.system(size: 36))
                            .offset(x: 0, y: -10.0)
                            .foregroundColor(.red)
                    })
                }
                Spacer()
            }
        }
        .frame(width: UIScreen.main.bounds.width/2-20, height: 100, alignment: .center)
        }

}

//struct NoteDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        NoteDetail()
//    }
//}
