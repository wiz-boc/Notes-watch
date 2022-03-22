//
//  Note.swift
//  Notes-watch WatchKit Extension
//
//  Created by wizz on 11/30/21.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
