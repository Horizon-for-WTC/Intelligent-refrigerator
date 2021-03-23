//
//  NoteAdd.swift
//  Intelligent refrigerator
//
//  Created by 陈佳俊 on 2021/3/23.
//

import SwiftUI

struct NoteAdd: View {
    @Environment(\.presentationMode)var presentationMode
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Notes.entity(), sortDescriptors: [])
    var note:FetchedResults<Notes>
    @State var name=""
    @State var index=0
    @State var content=""
    @State var date=Date()
    @State var top="B"
    @State var id=UUID()
    @State var collect=false
    @State var isedit=false
    var body: some View{
        Form{
            Section(header: Text("选择区").font(.largeTitle)){
                TextField("你的名字", text: $name)
                TextField("记录此刻美好的想法", text: $content)
                DatePicker(selection: $date){
                    Text("时间")
                }
            }
            Section(header: Text("保存").font(.largeTitle)) {
                Button(action: {
                    //保存
                    if !isedit{
                    self.index=note.endIndex
                    let newitem=Notes(context: moc)
                    newitem.id=self.id
                    newitem.top=top
                    newitem.index=Int16(index)
                    newitem.collect=self.collect
                    newitem.content=self.content
                    newitem.name=self.name
                    newitem.date=self.date
                    }else if(isedit){
                        //修改
                        //判断index是否正确
                        if self.index>=note.count{
                            //修改回来
                            self.index=self.index-(Int(note[note.endIndex].index)-note.endIndex)
                        }
                        note[index].name=self.name
                        note[index].content=self.content
                        note[index].date=self.date
                    }
                    do{
                        try moc.save()
                    }catch{
                        print(error.localizedDescription)
                        }
                    presentationMode.wrappedValue.dismiss()
//                    qq()
                }, label: {
                    Text("确定")
                })
            }
        }
    }
    
//发送数据
//    func qq()  {
//        let encoder=JSONEncoder()
//        let decoder=JSONDecoder()
//        let data=try! encoder.encode( TextItem(collect: self.collect, content: self.content, data: self.date, id: self.id, index: Int16(self.index), name: self.name, top: self.top))
//        //发送数据
//        let url = URL(string: "https://reqres.in/")
//        var request = URLRequest(url: url!)
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpMethod="POST"
//        request.httpBody=data
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data {
//                 let decodedResponse = try? decoder.decode(TextItem.self, from: data)
//                    print("成功")
//                print(decodedResponse?.index)
//
//            }
//            print(response ?? "wu")
//
//        }.resume()
//        }
    }

struct NoteAdd_Previews: PreviewProvider {
    static var previews: some View {
        NoteAdd()
    }
}
