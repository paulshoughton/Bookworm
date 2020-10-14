//
//  ContentView.swift
//  Bookworm
//
//  Created by Paul Houghton on 12/10/2020.
//

import CoreData
import SwiftUI

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.4), Color(white: 0.6)]
     
    var body: some View {
        Button(title) {
            self.isOn.toggle()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct ContentView: View {
//    @FetchRequest(entity: Student.entity(), sortDescriptors: []) var students: FetchedResults<Student>
    
    @Environment(\.managedObjectContext) var viewContext

    @FetchRequest(entity: Book.entity(), sortDescriptors: []) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false

//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>

//    @State private var rememberMe = false
    
//    @Environment(\.horizontalSizeClass) var sizeClass
    
    
    var body: some View {

        NavigationView {
            List {
                ForEach(books, id: \.self) { book in
                    NavigationLink(
                        destination: DetailView(book: book)
                    ) {
                        EmojiRatingView(rating: book.rating)
                            .font(.largeTitle)

                        VStack(alignment: .leading) {
                            Text(book.title ?? "Unknown title")
                                .font(.headline)
                            Text(book.author ?? "Unknown author")
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationBarTitle("Bookworm")
            .navigationBarItems(trailing: Button(action: {
                self.showingAddScreen.toggle()
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingAddScreen) {
                AddBookView().environment(\.managedObjectContext, self.viewContext)
            }
       }
        
//        Text("Hello, world!")
  
//        VStack {
//            List {
//                ForEach(students, id: \.id) { student in
//                    Text(student.name ?? "Unknown")
//                }
//            }
//
//            Button("Add") {
//                let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
//                let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
//
//                let chosenFirstName = firstNames.randomElement()!
//                let chosenLastName = lastNames.randomElement()!
//
//                let student = Student(context: self.viewContext)
//                student.id = UUID()
//                student.name = "\(chosenFirstName) \(chosenLastName)"
//
//                try? self.viewContext.save()
//
//            }
//        }
        
        
//        if sizeClass == .compact {
//            return AnyView(VStack {
//                Text("Active size class:")
//                Text("COMPACT")
//            }
//            .font(.largeTitle))
//        }
//        else {
//            return  AnyView(HStack {
//                Text("Active size class:")
//                Text("REGULAR")
//            }
//            .font(.largeTitle))
//        }
        
//        Toggle(isOn: $rememberMe) {
//            Text("Remember Me")
//        }
        
//        VStack {
//            PushButton(title: "Remember Me", isOn: $rememberMe)
//            Text(rememberMe ? "On" : "Off")
//        }
        
//        List {
//            ForEach(items) { item in
//                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//            }
//            .onDelete(perform: deleteItems)
//        }
//        .toolbar {
//            #if os(iOS)
//            EditButton()
//            #endif
//
//            Button(action: addItem) {
//                Label("Add Item", systemImage: "plus")
//            }
//        }

    }
        
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }

//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
}

//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
