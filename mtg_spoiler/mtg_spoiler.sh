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

  # check if different
  DIFF=$(diff oldSRCs newSRCs) 

  # open page and send alert to arduino
  if [ "$DIFF" != "" ] 
  then
    google-chrome "http://www.magicspoiler.com/dragons-tarkir-spoiler/"
    echo "gyrd100bhfd100gyrd100bhf100gyrd100bhfgyrd100bhfd100gyrd100bhf100gyrd100bhfgyrd100bhfd100gyrd100bhf100gyrd100bhf" > /dev/ttyUSB0
  fi

  cd -
}
