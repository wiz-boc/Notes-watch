//
//  HeaderView.swift
//  Notes-watch WatchKit Extension
//
//  Created by wizz on 12/1/21.
//

import SwiftUI

struct HeaderView: View {
    var title = ""
    
    var body: some View {
        VStack {
            //TITLE
            if title != "wiz" {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
            }
            //SEPARATOR
            HStack{
                Capsule()
                    .frame(height: 1)
                Image(systemName: "note.text")
                Capsule()
                    .frame(height: 1)
            }
            .foregroundColor(.accentColor)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView(title: "Credits")
            HeaderView()
        }
    }
}
