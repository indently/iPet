//
//  Helpers.swift
//  iPet
//
//  Created by Federico on 06/03/2022.
//

import Foundation
import SwiftUI

func calcTimeSince(date: Date) -> Int {
    let seconds = Int(-date.timeIntervalSinceNow)
    return seconds
}
