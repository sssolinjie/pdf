//
//  DocumentRepository.swift
//  pdf
//
//  Created by 林炳午 on 2024/3/8.
//

import Foundation
class DocumentRepository : Repository<Document> {
    func register(renderer: CGPDFDocument) -> Document {
        let id = NSUUID().uuidString
        let page = Document(id: id, renderer: renderer)
        set(id: id, item: page)
        return page
    }
}
