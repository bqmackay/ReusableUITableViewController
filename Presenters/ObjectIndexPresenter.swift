//
//  ObjectIndexPresenter.swift
//  EnumTable
//
//  Created by Byron Mackay on 9/23/20.
//

import UIKit

class ObjectIndexPresenter: EnumPresenterProtocol {
    var cells: [Cell] = []
    
    private enum IndexObject {
        case contact, product
        
        
    }
    
    func loadCells() {
        cells = [
            Cell(title: "Contact", value: IndexObject.contact, cellType: .text),
            Cell(title: "Product", value: IndexObject.product, cellType: .text)
        ]
    }
    
    func getShowPresenter(at row: Int) -> EnumPresenterProtocol? {
        switch cells[row].value as? IndexObject {
        case .contact:
            let contact = Contact(
                name: "Bob Smith",
                address: "123 Kestral St",
                birthdate: Date().addingTimeInterval(-1000000),
                isFavorite: false,
                phoneNumber: "888-555-1234"
            )
            return ContactShowPresenter(contact: contact)
        case .product:
            let product = Product(name: "Shirt", price: "$10.00", style: "Tee")
            return ProductShowPresenter(product: product)
        case .none:
            return nil
        }
    }

}
