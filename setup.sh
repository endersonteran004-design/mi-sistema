#!/data/data/com.termux/files/usr/bin/bash

echo "🔥 Restaurando el Infierno de endersonteran004-design... 🔥"

# 1. Actualización y Dependencias Críticas
pkg update && pkg upgrade -y
pkg install python git wget curl ffmpeg aria2c figlet jq nodejs -y

# 2. Instalación de Herramientas de Descarga
pip install --upgrade pip
pip install yt-dlp gallery-dl

# 3. Creación del archivo .bashrc (Tu V45 Personalizada)
cat << 'EOF' > ~/.bashrc
# --- NUBE ULTRA-INTELIGENTE V45 (RESTAURADA) ---
clear
figlet -f slant 'ENDERSON'
echo -e "\n🔥 Tu infierno está completo, perra. Nada se pierde. 🔥\n"

export BASE_DIR="/sdcard/Download/termux_bitch"
DB_FILE="$BASE_DIR/subidos.db"
mkdir -p "$BASE_DIR/youtube_bitch" "$BASE_DIR/re_descargas_bitches" "$BASE_DIR/fotos_universal" "$BASE_DIR/musica_estudio_opus" "$BASE_DIR/APK"
touch "$DB_FILE"

TOKEN="8736253373:AAFk6UbdjyXmXh8HTbpuSvGWC4D07OhZm-w"
ID_DESTINO="-1003885014030"

# --- CONFIGURACIÓN DE PROMPT Y MENSAJE ---
PS1='\[\e[1;32m\]\w\[\e[0m\] \[\e[1;33m\]$ \[\e[0m\]'

function acabado {
    echo -e "\e[1;35m( listo perra ☑️ )\e[0m"
}
PROMPT_COMMAND=acabado

# --- ALIAS ---
alias re='f(){ url=$(echo "$1" | cut -d"?" -f1); yt-dlp --external-downloader aria2c --external-downloader-args "-x 16 -s 16 -k 1M" -o "$BASE_DIR/re_descargas_bitches/%(title)s.%(ext)s" "$url" || gallery-dl --directory "$BASE_DIR/re_descargas_bitches" "$url"; [ $? -eq 0 ] && termux-media-scan "$BASE_DIR/re_descargas_bitches"/*; }; f'
alias bajar='f(){ url=$(echo "$1" | cut -d"?" -f1); yt-dlp -f "bestvideo[height<=1080]+251/bestaudio/best" --external-downloader aria2c -o "$BASE_DIR/youtube_bitch/%(title)s.%(ext)s" "$url" && termux-media-scan "$BASE_DIR/youtube_bitch"/*; }; f'
alias fotos='f(){ url=$(echo "$1" | cut -d"?" -f1); gallery-dl -o "base-directory=$BASE_DIR/fotos_universal" "$url" && termux-media-scan "$BASE_DIR/fotos_universal"/*; }; f'
alias audio='f(){ url=$(echo "$1" | cut -d"?" -f1); yt-dlp -x --audio-format opus --audio-quality 0 --external-downloader aria2c -o "$BASE_DIR/musica_estudio_opus/%(title)s.%(ext)s" "$url"; [ $? -eq 0 ] && termux-media-scan "$BASE_DIR/musica_estudio_opus"/*; }; f'
alias orden='termux-media-scan "$BASE_DIR"/*; echo " ✅ Galería sincronizada."'
alias reload='source ~/.bashrc && echo "Configuración V45 recargada"'

clon() {
    MIS_RUTAS=("/sdcard/DCIM" "/sdcard/Download" "/sdcard/Movies" "/sdcard/Instagram" "/sdcard/Pictures" "/sdcard/Music")
    for RUTA in "${MIS_RUTAS[@]}"; do
        [ ! -d "$RUTA" ] && continue
        CARPETA_NOM=$(basename "$RUTA")
        curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" -d "chat_id=$ID_DESTINO" -d "text=📁 --- INICIO: $CARPETA_NOM --- 📁" > /dev/null
        find "$RUTA" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.mp4" -o -iname "*.flac" -o -iname "*.mp3" \) -size +15k ! -path "*/.*" -print0 | while read -r -d '' p; do
            NOMBRE=$(basename "$p")
            if grep -qx "$NOMBRE" "$DB_FILE"; then continue; fi
            RESP=$(curl -s -F document=@"$p" -F caption="📍 Origen: $CARPETA_NOM" "https://api.telegram.org/bot$TOKEN/sendDocument?chat_id=$ID_DESTINO")
            [[ "$RESP" == *"\"ok\":true"* ]] && echo "$NOMBRE" >> "$DB_FILE"
        done
    done
}
EOF

source ~/.bashrc
echo "✔️ Restauración completa. V45 inyectada con aviso de finalización."
