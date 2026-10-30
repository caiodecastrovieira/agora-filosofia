#!/usr/bin/env bash
# Copia os ícones do Ágora para o projeto Android gerado pelo Capacitor.
set -e
RES=android/app/src/main/res
rm -rf "$RES/mipmap-anydpi-v26"
for d in mdpi hdpi xhdpi xxhdpi xxxhdpi; do
  cp icon/mipmap-$d/ic_launcher.png "$RES/mipmap-$d/ic_launcher.png"
  cp icon/mipmap-$d/ic_launcher_round.png "$RES/mipmap-$d/ic_launcher_round.png"
  rm -f "$RES/mipmap-$d/ic_launcher_foreground.png"
done


# Tela de abertura: fundo cor de papel com o ícone no centro
find "$RES" -name 'splash.png' -delete
mkdir -p "$RES/drawable-nodpi"
cp icon/icon-512.png "$RES/drawable-nodpi/splash_icon.png"
cat > "$RES/drawable/splash.xml" <<'XML'
<?xml version="1.0" encoding="utf-8"?>
<layer-list xmlns:android="http://schemas.android.com/apk/res/android">
  <item><color android:color="#f5f0e6"/></item>
  <item android:width="144dp" android:height="144dp" android:gravity="center" android:drawable="@drawable/splash_icon"/>
</layer-list>
XML
echo "Tela de abertura aplicada."
