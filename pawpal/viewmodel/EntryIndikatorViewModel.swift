//
//  EntryIndikatorViewModel.swift
//  pawpal
//
//  Created by ni nyoman putri shopia yuandari on 21/08/23.
//

import Foundation

class EntryIndikatorViewModel: ObservableObject {
    @Published var isPupilPopoverVisible = false
    @Published var isEkorPopoverVisible = false
    @Published var isSuaraPopoverVisible = false
    @Published var isBentukBadanPopoverVisible = false
    @Published var isTelingaPopoverVisible = false
    
    @Published var pupilDragAmount: CGPoint?
    @Published var ekorDragAmount: CGPoint?
    @Published var suaraDragAmount: CGPoint?
    @Published var bentukBadanDragAmount: CGPoint?
    @Published var telingaDragAmount: CGPoint?
    
}
