
# This code for converting dos to unix format from Windows to Linux (Termux)

dir='GCAndroid'

cd "$HOME/.ElaXan" || exit 1

for file in $(find "$dir" -type f); do
    dos2unix "$file"
done