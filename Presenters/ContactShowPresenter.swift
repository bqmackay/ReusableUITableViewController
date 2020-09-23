//
//  EnumTableViewPresenter.swift
//  EnumTable
//
//  Created by Byron Mackay on 9/22/20.
//

import Foundation

class ContactShowPresenter: EnumPresenterProtocol {
    
    var contact: Contact
    
    var cells: [Cell] = []
    
    init(contact: Contact) {
        self.contact = contact
    }
    
    func loadCells() {
        ///ensure this is a fresh set of cells
        cells = []
    
        if let value = contact.name {
            cells.append(Cell(title: "Name", value: value, cellType: .text))
        }
        
        if let value = contact.address {
            cells.append(Cell(title: "Address", value: value, cellType: .text))
        }
        
        if let value = contact.birthdate {
            cells.append(Cell(title: "Birthdate", value: value, cellType: .text))
        }
        
        cells.append(Cell(title: "Favorite", value: contact.isFavorite, cellType: .toggle))
    
    }
    
}
