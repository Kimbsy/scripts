# Checks for updates to magicspoiler.com
# grabs the links for all images and compares
# them to the last time it was run.

spoil() {
  cd ~/Tools/scripts/mtg_spoiler

  # get rid of old old srcs
  rm oldSRCs

  # move new to old
  mv newSRCs oldSRCs

  # get new HTML
  wget -O HTML http://www.magicspoiler.com/dragons-tarkir-spoiler/

  echo ''
  echo 'Comparing URLS...'

  # get new srcs
  grep -o 'src="[^"]*2015[^"]*"' HTML | grep -o '"[^"]*"' > newSRCs

  # compare files and open new images in chrome
  grep -Fxvf newSRCs oldSRCs | while read -r line ; do
    echo "$line"
    google-chrome "$line"

    echo "gyrd300bhfd300gyrd300bhf300gyrd300bhfgyrd300bhfd300gyrd300bhf300gyrd300bhfgyrd300bhfd300gyrd300bhf300gyrd300bhf" > /dev/ttyUSB0
  done

  cd -
}
