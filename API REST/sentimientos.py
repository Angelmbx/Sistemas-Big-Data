from googleapiclient.discovery import build
from textblob import TextBlob

# Configuración de la API de YouTube
API_KEY = ""  # Clave de la API
YOUTUBE_API_SERVICE_NAME = "youtube"
YOUTUBE_API_VERSION = "v3"

# ID del video a analizar (extraído de la URL)
VIDEO_URL = "https://www.youtube.com/watch?v=kM-94LhhQTs"
VIDEO_ID = VIDEO_URL.split("v=")[-1]

def obtener_titulo_video(video_id):
    # Construcción del cliente de la API de YouTube
    youtube = build(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION, developerKey=API_KEY)
    
    # Llamada a la API para obtener el título del video
    respuesta = youtube.videos().list(
        part="snippet",
        id=video_id
    ).execute()
    
    # Extraer el título
    if respuesta["items"]:
        return respuesta["items"][0]["snippet"]["title"]
    else:
        return "Título no disponible"

def obtener_comentarios(video_id, max_resultados=100):
    # Construcción del cliente de la API de YouTube
    youtube = build(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION, developerKey=API_KEY)

    # Llamada a la API para obtener los comentarios
    respuesta = youtube.commentThreads().list(
        part="snippet",
        videoId=video_id,
        maxResults=max_resultados,
        textFormat="plainText"
    ).execute()

    comentarios = []
    for item in respuesta.get("items", []):
        comentario = item["snippet"]["topLevelComment"]["snippet"]["textDisplay"]
        comentarios.append(comentario)

    return comentarios

def analizar_sentimientos(comentarios):
    total_sentimiento = 0
    for comentario in comentarios:
        analisis = TextBlob(comentario)
        total_sentimiento += analisis.sentiment.polarity
    promedio_sentimiento = total_sentimiento / len(comentarios) if comentarios else 0
    return promedio_sentimiento

if __name__ == "__main__":
    print("Analizando comentarios del video...")
    
    # Obtener título del video
    titulo_video = obtener_titulo_video(VIDEO_ID)
    
    # Obtener comentarios del video
    comentarios = obtener_comentarios(VIDEO_ID)
    
    if not comentarios:
        print("No se encontraron comentarios para este video.")
    else:
        # Realizar análisis de sentimientos
        promedio_sentimientos = analizar_sentimientos(comentarios)
        
        # Mostrar resultados
        print(f"Título del video: {titulo_video}")
        print(f"Número total de comentarios: {len(comentarios)}")
        print(f"Promedio de sentimientos: {promedio_sentimientos:.2f}")
