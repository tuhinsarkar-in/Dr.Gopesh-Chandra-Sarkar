$mappings = @{
    "pic01" = "dr-gopesh-chandra-sarkar-bjp-2009"
    "pic02" = "dr-gopesh-chandra-sarkar-gallery-2"
    "pic03" = "dr-gopesh-chandra-sarkar-gallery-3"
    "pic04" = "dr-gopesh-chandra-sarkar-bjp-2009-lok-sabha"
    "pic05" = "dr-gopesh-chandra-sarkar-bjp-2009-election"
    "pic06" = "dr-gopesh-chandra-sarkar-arjun-munda-2004"
    "pic07" = "dr-gopesh-chandra-sarkar-gallery-7"
    "pic08" = "dr-gopesh-chandra-sarkar-bjp-meet"
    "pic09" = "dr-gopesh-chandra-sarkar-speech"
    "pic10" = "dr-gopesh-chandra-sarkar-swuswagatam-cultural-function-2000"
    "pic11" = "dr-gopesh-chandra-sarkar-abvp-stage"
    "pic12" = "dr-gopesh-chandra-sarkar-rajendra-singh-rss-1"
    "pic13" = "dr-gopesh-chandra-sarkar-rajendra-singh-rss-2"
    "pic14" = "dr-gopesh-chandra-sarkar-rajendra-singh-rss-3"
    "pic15" = "dr-gopesh-chandra-sarkar-rajendra-singh-rss-4"
    "pic16" = "dr-gopesh-chandra-sarkar-rajendra-singh-rss-5"
    "pic17" = "dr-gopesh-chandra-sarkar-sandhanichakra"
    "pic18" = "dr-gopesh-chandra-sarkar-sandhanichakra-exhibition"
    "pic19" = "dr-gopesh-chandra-sarkar-flute-music"
    "pic20" = "dr-gopesh-chandra-sarkar-magic"
    "pic21" = "dr-gopesh-chandra-sarkar-magic-show-raiganj"
    "pic22" = "dr-gopesh-chandra-sarkar-abvp-speech"
    "pic23" = "dr-gopesh-chandra-sarkar-hemanta-mukhopadhyay-1984"
    "pic24" = "dr-gopesh-chandra-sarkar-gallery-24"
    "pic25" = "dr-gopesh-chandra-sarkar-gallery-25"
    "pic26" = "dr-gopesh-chandra-sarkar-gallery-26"
    "pic27" = "dr-gopesh-chandra-sarkar-abrsm-nagpur"
    "pic28" = "dr-gopesh-chandra-sarkar-rashtra-sevika-samitee-shanthakka"
    "pic29" = "dr-gopesh-chandra-sarkar-gallery-29"
    "pic30" = "dr-gopesh-chandra-sarkar-shri-krishna-matlog-rss"
    "pic31" = "dr-gopesh-chandra-sarkar-gallery-31"
    "pic32" = "dr-gopesh-chandra-sarkar-free-medical-camp"
    "pic33" = "dr-gopesh-chandra-sarkar-gallery-33"
}

$galleryFile = "gallery.html"
$content = Get-Content $galleryFile -Raw

foreach ($key in $mappings.Keys) {
    $newName = $mappings[$key]
    
    # Rename in images/
    $oldImagePath = "images\$key.jpg"
    $newImagePath = "images\$newName.jpg"
    if (Test-Path $oldImagePath) {
        Rename-Item -Path $oldImagePath -NewName "$newName.jpg"
    }

    # Rename in thumb/ (check for webp)
    $oldThumbPathWebp = "thumb\$key.webp"
    $newThumbPathWebp = "thumb\$newName.webp"
    if (Test-Path $oldThumbPathWebp) {
        Rename-Item -Path $oldThumbPathWebp -NewName "$newName.webp"
    }

    # Update gallery.html content
    $content = $content -replace "$key.jpg", "$newName.jpg"
    $content = $content -replace "$key.webp", "$newName.webp"
}

Set-Content -Path $galleryFile -Value $content
Write-Host "Done"
