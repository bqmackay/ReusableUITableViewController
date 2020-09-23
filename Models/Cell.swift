//
//  Cell.swift
//  EnumTable
//
//  Created by Byron Mackay on 9/22/20.
//

import UIKit

struct Cell {
    var title: String
    var value: Any?
    var cellType: CellType
}

enum CellType {
    case text, toggle, image
}
