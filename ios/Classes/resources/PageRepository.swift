//
//  PageRepository.swift
//  pdf
//
//  Created by 林炳午 on 2024/3/8.
//

class PageRepository : Repository<Page> {
    func register(documentId: String, renderer: CGPDFPage) -> Page {
        let id = NSUUID().uuidString
        let page = Page(id: id, documentId: documentId, renderer: renderer)
        set(id: id, item: page)
        return page
    }
}
