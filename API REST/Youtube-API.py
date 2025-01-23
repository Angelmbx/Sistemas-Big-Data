from googleapiclient.discovery import build

# Configuración de la API
API_KEY = "" # Clave API aqui 
YOUTUBE_API_SERVICE_NAME = "youtube"
YOUTUBE_API_VERSION = "v3"

# Temática del video
TEMA = "Iago Aspas"

# Construye y devuelve el cliente de la API de YouTube
def construir_cliente_youtube():
    return build(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION, developerKey=API_KEY)

# Obtiene una lista de videos según qué filtro apliquemos (más vistos o mejor valorados)
def obtener_videos(tema, max_resultados=5, idioma="es", orden="viewCount"):
    youtube = construir_cliente_youtube()

    # Realizar la búsqueda
    respuesta = youtube.search().list(
        q=tema,
        part="snippet",
        type="video",
        maxResults=max_resultados,
        relevanceLanguage=idioma,
        order=orden
    ).execute()

    # Procesar los resultados
    videos = [
        {
            "titulo": item["snippet"]["title"],
            "canal": item["snippet"]["channelTitle"],
            "video_id": item["id"]["videoId"]
        }
        for item in respuesta.get("items", [])
    ]
    return videos

# Muestra resultados de la búsqueda
def mostrar_videos(videos, filtro):
    print(f"\nVideos más {filtro} sobre '{TEMA}':")
    print("-" * 50)
    for i, video in enumerate(videos, start=1):
        print(f"Video {i}:")
        print(f"Título: {video['titulo']}")
        print(f"Canal: {video['canal']}")
        print(f"URL: https://www.youtube.com/watch?v={video['video_id']}")
        print("-" * 50)

if __name__ == "__main__":
    max_videos = 5
    idioma = "es"

    # Obtener y mostrar los videos más vistos
    mas_vistos = obtener_videos(TEMA, max_videos, idioma, orden="viewCount")
    mostrar_videos(mas_vistos, "vistos")

    # Obtener y mostrar los videos más valorados
    mas_valorados = obtener_videos(TEMA, max_videos, idioma, orden="rating")
    mostrar_videos(mas_valorados, "valorados")
