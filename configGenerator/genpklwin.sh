VERSION=1.0rc3
rm -f -r results/*
./configGenerator.pl $VERSION win_msklc_azerty | iconv -f utf-8 -t utf-16 > "results/fr-dvorak-bepo-${VERSION}A.klc"
./configGenerator.pl $VERSION win_msklc_bepo   | iconv -f utf-8 -t utf-16 > "results/fr-dvorak-bepo-${VERSION}B.klc"
./configGenerator.pl $VERSION win_msklc_qwertz | iconv -f utf-8 -t utf-16 > "results/fr-dvorak-bepo-${VERSION}C.klc"

#VK AZERTY
perl klc2ini.pl results/fr-dvorak-bepo-${VERSION}A.klc
mkdir -p results/pkl/fr-dvorak-bepo-${VERSION}-azerty/
mv results/layout.ini results/pkl/fr-dvorak-bepo-${VERSION}-azerty/

#VK QWERTZ
perl klc2ini.pl results/fr-dvorak-bepo-${VERSION}C.klc
mkdir -p results/pkl/fr-dvorak-bepo-${VERSION}-qwertz/
mv results/layout.ini results/pkl/fr-dvorak-bepo-${VERSION}-qwertz/

#VK�B�PO sans m�thode dactylographique (g�n�ration des images avec Pearl Crescent Page Saver sous firefox)
perl klc2ini.pl results/fr-dvorak-bepo-${VERSION}B.klc
awk '{print} /\[fingers\]/ {print "methode = aucune"}' < results/layout.ini > results/layout0.ini
mv results/layout0.ini results/layout.ini
perl ini2html.pl results/layout.ini
firefox -savepng "results/layout.html"
#>Screengrab est une alternative � pearlcrescent<
#firefox -p screengrab -no-remote -savepng results/layout.html
mv "$HOMEDRIVE$HOMEPATH\Bureau\Image de la page.png" "results/layout.png"
perl split_png.pl
mkdir -p results/pkl/fr-dvorak-bepo-${VERSION}/
rm results/layout.png
mv results/layout.ini results/*.html results/*.png  results/pkl/fr-dvorak-bepo-${VERSION}/

#VK B�PO m�thode dactylographique standard
perl klc2ini.pl results/fr-dvorak-bepo-${VERSION}B.klc
awk '{print} /\[fingers\]/ {print "methode = standard\nrow1 = 1123445567888\nrow2 = 112344556788\nrow3 = 112344556788\nrow4 = 11234455678"}' < results/layout.ini > results/layout0.ini
mv results/layout0.ini results/layout.ini
perl ini2html.pl results/layout.ini
firefox -savepng "results/layout.html"
mv "$HOMEDRIVE$HOMEPATH\Bureau\Image de la page.png" "results/layout.png"
perl split_png.pl
mkdir -p results/pkl/fr-dvorak-bepo-${VERSION}-st/
rm results/layout.png results/layout.html
mv results/layout.ini results/*.png  results/pkl/fr-dvorak-bepo-${VERSION}-st/

#VK B�PO�m�thode dactylographique O0
perl klc2ini.pl results/fr-dvorak-bepo-${VERSION}B.klc
awk '{print} /\[fingers\]/ {print "methode = o0\nrow1 = 1112344556788\nrow2 = 112344556788\nrow3 = 112344556788\nrow4 = 11234455678"}' < results/layout.ini > results/layout0.ini
mv results/layout0.ini results/layout.ini
perl ini2html.pl results/layout.ini
firefox -savepng "results/layout.html"
mv "$HOMEDRIVE$HOMEPATH\Bureau\Image de la page.png" "results/layout.png"
perl split_png.pl
mkdir -p results/pkl/fr-dvorak-bepo-${VERSION}-o0/
rm results/layout.png results/layout.html
mv results/layout.ini results/*.png  results/pkl/fr-dvorak-bepo-${VERSION}-o0/

#VK�B�PO�m�thode dactylographique T6
perl klc2ini.pl results/fr-dvorak-bepo-${VERSION}B.klc
awk '{print} /\[fingers\]/ {print "methode = t6\nrow1 = 1123444567888\nrow2 = 112344556788\nrow3 = 112344556788\nrow4 = 11234455678"}' < results/layout.ini > results/layout0.ini
mv results/layout0.ini results/layout.ini
perl ini2html.pl results/layout.ini
firefox -savepng "results/layout.html"
mv "$HOMEDRIVE$HOMEPATH\Bureau\Image de la page.png" "results/layout.png"
perl split_png.pl
mkdir -p results/pkl/fr-dvorak-bepo-${VERSION}-t6/
rm results/layout.png results/layout.html
mv results/layout.ini results/*.png  results/pkl/fr-dvorak-bepo-${VERSION}-t6/

#HTML (d�placement � la racine)
mv results/pkl/fr-dvorak-bepo-${VERSION}/layout.html results/