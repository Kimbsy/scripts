# grab the most recent image from NASA's astonomy picture of the day site

# get the html content of the front page
CONTENT=$(wget apod.nasa.gov/apod/astropix.html -q -O -)

echo $CONTENT

# find the src of the image (there should only be one)
REGEX="SRC=\"image\/[0-9]+\/.+.jpg"

if [[ $CONTENT =~ $REGEX ]]; then
  echo "match found"
  echo "matching substring: ${BASH_REMATCH[0]}"

  # strip the extra characters from the source
  SOURCE=$(echo ${BASH_REMATCH[0]/SRC=/} | tr -d \")

  echo $SOURCE

  # download the image with wget
  wget -P ~/Pictures/NASA http://apod.nasa.gov/$SOURCE
    
else
    echo "no match found"
fi
