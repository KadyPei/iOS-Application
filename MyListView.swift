//
//  ContentView.swift
//  MyListView
//
//  Created by Tiffany Hsu on 12/7/19.
//  Copyright © 2019 nyu.edu. All rights reserved.
//

import SwiftUI
import Combine
import FirebaseFirestore
import FirebaseDatabase
import FirebaseAuth


struct MyList: Identifiable {
  //  var ref: DatabaseReference!
    var id = UUID()
    var listName: String
    
 //   let ref:DatabaseReference?
  //  init(MyList: String, listName: UUID(), id:
    
}

struct blahView: View {
    var body: some View {
        FavoritesList()
    }
}

struct MyListView: View {

    @State var modelData: [MyList] = [MyList(listName: "Favorites")]
    @State var isPresentingAddModal = false
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(self.modelData, id:\.id) { li in
                    NavigationLink(destination:blahView()) {
                        Text("\(li.listName)").fontWeight(.semibold)
                    }
                }.onDelete(perform: self.delete)
            }
                .navigationBarTitle(Text("Your Personal Lists").font(.title))
                .navigationBarHidden(false)
                .navigationBarItems(trailing: Button(action: {
                self.isPresentingAddModal.toggle()
            }) {
                Image(systemName: "plus.circle").resizable().frame(width:30, height:30).padding(.top,20)
            })
        .sheet(isPresented: $isPresentingAddModal, content: {
            AddModal(isPresented: self.$isPresentingAddModal, didAddList: {
                mylist in
                print(mylist.listName)
                self.modelData.append(mylist)
            })
        })
    }
    }
    
    private func delete(with indexSet: IndexSet) {
        indexSet.forEach { modelData.remove(at: $0)}
    }
}

struct AddModal: View {

    @Binding var isPresented: Bool
    @State var listName = ""

    var didAddList: (MyList) -> ()

    var body: some View {
        VStack {

            VStack (spacing: 16) {
                Text("List Name").font(.title).fontWeight(.bold)
                TextField("Enter List Name", text: $listName).textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding([.top, .bottom])

            HStack {
                Button(action: {
                    self.isPresented = false

                    self.didAddList(.init(listName:self.listName))

                }, label: {
                    Text("Add List")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.all, 16)
                        .background(Color.orange)
                        .clipShape(RoundedRectangle(cornerRadius: 8))

                })
                Button(action: {
                    self.isPresented = false
                }, label: {
                    Text("Cancel")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.all, 16)
                        .background(Color.red)
                        .clipShape(RoundedRectangle(cornerRadius: 8))

                })
            }
            Spacer() //everything is pushed upward
        }.padding(.all, 16)

    }
}

struct MyListView_Previews: PreviewProvider {
    static var previews: some View {
        MyListView()
    }
}
