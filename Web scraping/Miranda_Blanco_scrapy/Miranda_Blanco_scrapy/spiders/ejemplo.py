import scrapy

class ZapatillasSpider(scrapy.Spider):
    name = 'zapatillas'
    start_urls = ['https://www.alssport.es/101-zapatillas-hombre-running']

    def parse(self, response):
        for producto in response.css('div.product-container'):
            # Extraer el nombre del producto
            nombre_producto = producto.css('span.product_list_name::text').get()
            if nombre_producto: 
                nombre_producto = nombre_producto.strip()

            # Extraer el precio con descuento
            precio_descuento = producto.css('span.price.product-price::text').get()
            if precio_descuento:
                precio_descuento = precio_descuento.strip()

            # Extraer el precio original
            precio_original = producto.css('span.old-price.product-price::text').get()
            if precio_original:
                precio_original = precio_original.strip()

            # Extraer el porcentaje de descuento
            porcentaje_desc = producto.css('span.price-percent-reduction::text').get()
            if porcentaje_desc:
                porcentaje_desc = porcentaje_desc.strip()

            # Extraer la URL del producto (enlace)
            enlace_producto = producto.css('a.product_img_link::attr(href)').get()

            # Devolver los datos extraídos
            yield {
                'nombre_producto': nombre_producto,
                'precio_descuento': precio_descuento,
                'precio_original': precio_original,
                'porcentaje_descuento': porcentaje_desc,
                'enlace_producto': enlace_producto,
            }
