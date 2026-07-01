//
//  Coordinator.swift
//  ecom-mvvm
//
//  Created by Dinesh Kumar on 01/07/26.
//

import Foundation
import SwiftUI

protocol Coordinator: ObservableObject {
    var path: NavigationPath { get set }
}
