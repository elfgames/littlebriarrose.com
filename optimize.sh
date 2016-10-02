#/bin/sh

echo "======================="
echo "Optimizing images"
echo "======================="
find . -name '*.png' | xargs optipng -o4 | cat > /dev/null
find . -name '*.jpg' -exec jpegtran -optimize -progressive -outfile "{}.opt" "{}" \;
find . -name '*.jpg' -exec rm {} \;
find ./ -name "*.opt" -exec sh -c 'mv $0 "${0%.*}"' '{}' \;
find . -name '*.gif' -exec gifsicle --batch -O3 {} \;
echo "======================="
echo "DONE!"
echo "======================="
