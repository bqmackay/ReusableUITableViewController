//
//  ProductShowPresenter.swift
//  EnumTable
//
//  Created by Byron Mackay on 9/23/20.
//

import Foundation

class ProductShowPresenter: EnumPresenterProtocol {
        
    var product: Product
    
    var cells: [Cell] = []
    
    init(product: Product) {
        self.product = product
    }
    
    func loadCells() {
        ///ensure this is a fresh set of cells
        cells = []
    
        cells.append(Cell(title: "Name", value: product.name, cellType: .text))
        cells.append(Cell(title: "Price", value: product.price, cellType: .text))
        cells.append(Cell(title: "Style", value: product.style, cellType: .text))
    }
    
}
