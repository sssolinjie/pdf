package com.example.pdf.resources

import android.annotation.TargetApi
import android.graphics.pdf.PdfRenderer
import android.os.Build
import com.example.pdf.document.Page
import com.example.pdf.utils.randomID

@TargetApi(Build.VERSION_CODES.LOLLIPOP)
class PageRepository : Repository<Page>() {
    /**
     * Register page in repository
     * @returns page id
     */
    fun register(documentId: String, pageRenderer: PdfRenderer.Page): Page {
        val id = randomID
        val page = Page(id, documentId, pageRenderer)
        set(id, page)
        return page
    }

    public override fun close(id: String) {
        get(id).close()
        super.close(id)
    }
}