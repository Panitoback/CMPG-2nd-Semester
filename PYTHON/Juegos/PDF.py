import streamlit as st
from fpdf import FPDF

class PDF(FPDF):
    def header(self):
        if hasattr(self, 'document_title'):
            self.set_font('Arial', 'B', 12)
            self.cell(0, 10, self.document_title, 0, 1, 'C')
            
    def footer(self):
        self.set_y(-15)
        self.set_font('Arial','I',8)
        self.cell(0, 10, f'Pagina{self.page_no()}', 0, 0, 'C')
        
    def chapter_title(self, title, font='Arial', size=12):
        self.set_font(font, 'B', size)
        self.cell(0, 10, title, 0, 1, 'L')
        self.ln(10)
        
    def chapter_body(self, body, font='Arial', size=12):
        self.set_font(font, '', size)
        self.multi_cell(0, 10, body)
        self.ln()
        
def create_pdf(filename, document_title, author, chapters, image_path=None):
    pdf = PDF()
    pdf.document_title = document_title
    pdf.add_page()
    if author:
        pdf.set_author(author)
        
    if image_path:
        pdf.image(image_path, x=10, y=25, w=pdf.w - 20)
        pdf.ln(120)
        
    for chapter in chapters:
        title, body, font, size = chapter
        pdf.chapter_title(title, font, size)
        pdf.chapter_body(body,font,size)
        
    pdf.output(filename)
    
def main():
    st.title("Generador de PDF con python")
    st.header("Configuracion del Documento")
    document_title = st.text_input("Titulo del Documento", "Escribe aca:")
    author = st.text_input("Autor", "")
    uploaded_image = st.file_uploader("Sube una imagen para el documento (opcional)", type=["jpg", "png"])
    
    st.header("Capitulos del Documento")
    chapters = []
    chapter_count = st.number_input("Numero de capitulos", min_value=1, max_value=10, value=1)
    
    for i in range(chapter_count):
        st.subheader(f"Capitulo{i+1}")
        title = st.text_input(f"Titulo del Capitulo {i+1}", f"Titulo del Capitulo {i+1}")
        body = st.text_area(f"Cuerpo del Capitulo {i+1}", f"Cuerpo del Capitulo {i+1}")
        font = st.selectbox(f"Fuente del Capitulo {i+1}", ['Arial','Courier','Times'])
        size = st.slider(f"Tamaño de Fuente del Capitulo {i+1}", 8, 24, 12)
        
        chapters.append((title,body,font,size))
        
    if st.button("Generar PDF"):
        image_path = "temp_image" + uploaded_image.name if uploaded_image else None
        if image_path:
            with open(image_path, "wb") as f:
                f.write(uploaded_image.getbuffer())
                
        create_pdf("output.pdf", document_title, author, chapters, image_path)

        with open("output.pdf", "rb") as pdf_file:
            PDFbyte = pdf_file.read()
            
        st.download_button(
            label="Descargar PDF",
            data=PDFbyte,
            file_name="output.pdf",
            mime='application/octet-stream'
        )
        
        st.success("PDF GENERADO EXITOSAMENTE")

if __name__ == "__main__":
    main()