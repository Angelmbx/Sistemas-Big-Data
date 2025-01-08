import scrapy

class LibrosSpider(scrapy.Spider):
    name = 'libros'
    start_urls = ['https://www.santosochoa.es']

    def parse(self, response):
        for libro in response.css('div.item'):  # Seleccionamos cada libro individual
            # Extraer el título
            titulo = libro.css('h3.title a::text').get()
            if titulo:
                titulo = titulo.strip()

            # Extraer el autor
            autor = libro.css('small.author::text').get()
            if autor:
                autor = autor.strip()

            # Extraer el precio
            precio = libro.css('span[itemprop="price"]::text').get()
            if precio:
                precio = precio.strip()

            # Extraer disponibilidad
            disponibilidad = libro.css('strong.status::text').get()
            if disponibilidad:
                disponibilidad = disponibilidad.strip()

            # Devolver los datos extraídos
            yield {
                'titulo': titulo,
                'autor': autor,
                'precio': precio,
                'stock': disponibilidad
            }
