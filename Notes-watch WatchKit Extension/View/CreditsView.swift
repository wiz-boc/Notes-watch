//
//  CreditsView.swift
//  Notes-watch WatchKit Extension
//
//  Created by wizz on 12/1/21.
//

import SwiftUI

struct CreditsView: View {
    
    
    var body: some View {
        VStack(spacing: 3){
            //PROFILE IMAGE
            Image("developer-no1")
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            //HEADER
            HeaderView(title: "Credits")
            //CONTENT
            Text("Kenroy Wiz Gayle")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
        }
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
