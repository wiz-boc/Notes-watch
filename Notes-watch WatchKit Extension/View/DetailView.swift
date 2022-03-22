//
//  DetailView.swift
//  Notes-watch WatchKit Extension
//
//  Created by wizz on 12/1/21.
//

import SwiftUI

struct DetailView: View {
    let note: Note
    let count: Int
    let index: Int
    @State private var isCreditPresented = false
    @State private var isSettingsPresented = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            //HEADER
            HeaderView()
            //CONTENT
            Spacer()
            ScrollView(.vertical){
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            Spacer()
            //FOOTER
            HStack(alignment: .center){
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingsPresented.toggle()
                    }
                    .sheet(isPresented: $isSettingsPresented) {
                        SettingsView()
                    }

                Spacer()
                Text(" \(index+1) / \(count) ")
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditPresented.toggle()
                    }
                    .sheet(isPresented: $isCreditPresented) {
                            CreditsView()
                    }

            }
            .foregroundColor(.secondary)
        }
        .padding(3)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var sampleData = Note(id: UUID(), text: "Hey wiz, What is up?")
    static var previews: some View {
        DetailView(note: sampleData, count: 5, index: 1)
    }
}
