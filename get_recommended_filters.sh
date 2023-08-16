#!/bin/bash

# create an empty input.csv file
touch input.csv

# declare an array of urls
urls=(
  https://abpvn.com/android/abpvn.txt
  https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt
  https://raw.githubusercontent.com/bigdargon/hostsVN/master/extensions/adult/hosts-VN
  https://raw.githubusercontent.com/blocklistproject/Lists/master/alt-version/gambling-nl.txt
  https://raw.githubusercontent.com/bigdargon/hostsVN/master/option/domain.txt
  https://raw.githubusercontent.com/Sinfonietta/hostfiles/master/pornography-hosts
  https://raw.githubusercontent.com/robonxt/CleanYourReddit/master/CleanYourReddit.txt
  https://raw.githubusercontent.com/AdAway/adaway.github.io/master/hosts.txt
  https://gitlab.com/badmojr/1hosts/-/raw/main/mini/hosts.txt
)

# loop through the urls and download each file with curl
for url in "${urls[@]}"; do
  # get the file name from the url
  file=$(basename "$url")
  # download the file with curl and save it as file.txt
  curl -o "$file.txt" "$url"
  # append the file contents to input.csv and add a newline
  cat "$file.txt" >> input.csv
  echo "" >> input.csv
  # remove the file.txt
  rm "$file.txt"
done

# print a message when done
echo "Done. The input.csv file contains merged data from recommended filter lists."
