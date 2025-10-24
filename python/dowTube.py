from pytube import YouTube

def download_video():
    raw_url = input("🎬 Entrez l'URL de la vidéo YouTube : ")
    url = raw_url.split('&')[0]  # Nettoyer les paramètres

    try:
        yt = YouTube(url)
        print(f"\n📌 Titre : {yt.title}")
        print(f"⏱️ Durée : {yt.length // 60} minutes")

        # Choisir la meilleure qualité avec audio
        stream = yt.streams.filter(progressive=True, file_extension='mp4').order_by('resolution').desc().first()

        if stream:
            print("⬇️ Téléchargement en cours...")
            stream.download()
            print("✅ Téléchargement terminé avec succès !")
        else:
            print("❌ Aucune version téléchargeable avec audio trouvée.")

    except Exception as e:
        print("❌ Une erreur est survenue :", e)

if __name__ == "__main__":
    download_video()

