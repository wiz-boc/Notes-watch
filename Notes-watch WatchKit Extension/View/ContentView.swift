//
//  ContentView.swift
//  Notes-watch WatchKit Extension
//
//  Created by wizz on 11/30/21.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - PROPERTY
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var notes:[Note] = [Note]()
    @State private var text: String = ""
    
    
    //MARK: - FUNCTION
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func save(){
        do{
            let data = try JSONEncoder().encode(notes)
            let url = getDocumentDirectory().appendingPathComponent("notes")
            try data.write(to: url)
        }catch{
            print("saving data failed: \(error.localizedDescription) ")
        }
    }
    func load()
    {
        DispatchQueue.main.async {
            do{
                //1. Get notes URL path
                let url = getDocumentDirectory().appendingPathComponent("notes")
                //2. Create a new proerty for the data
                let data = try Data(contentsOf: url)
                //3. Decode the data
                notes = try JSONDecoder().decode([Note].self, from: data)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    func delete(offsets: IndexSet){
        withAnimation {
            notes.remove(atOffsets: offsets)
            save()
        }
    }
    
    //MARK: - BODY
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6) {
                TextField("Add new Note", text: $text)

                Button {
                    //1. Only run the button's action when the text field is not empty
                    guard text.isEmpty == false else { return }
                    //2. Create a new note item and initialize it with the text value
                    let note = Note(id: UUID(), text: text)
                    //3. Add the new item to the notes array
                    notes.append(note)
                    //4. Make the text field empty
                    text = ""
                    //5 Save the note (function)
                    save()
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 42, weight: .semibold))
                }
                .fixedSize()
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(.accentColor)
                //.buttonStyle(BorderedButtonStyle(tint: .accentColor))
           }
            Spacer()
            if notes.count >= 1 {
                List{
                    ForEach(0..<notes.count, id: \.self){ i in
                        NavigationLink(destination: DetailView(note: notes[i], count: notes.count, index: i)) {
                            HStack{
                                Capsule()
                                    .frame(width: 4)
                                    .foregroundColor(.accentColor)
                                Text(notes[i].text)
                                    .lineLimit(lineCount)
                                    .padding(.leading,5)
                            }
                        }
                    }
                    .onDelete(perform: delete)
                }
            } else {
                Spacer()
                Image(systemName: "note.text")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .opacity(0.25)
                Spacer()
            }
        }
        .navigationTitle("Notes")
        .onAppear {
            load()
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
