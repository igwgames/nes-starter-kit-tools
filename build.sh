# Make sure the bin directory exists
mkdir -p bin

PROJECTS="chr2img sprite_def2img tmx2c"
WINARCHS="node16-windows-x64"
ARCHS="node16-linux-x64 node16-linux-arm64"

for PROJ in $PROJECTS; do
    echo "Starting $PROJ"
    cd $PROJ/src
    npm install
    for ARCH in $WINARCHS; do
        echo "    Starting arch $ARCH"
        npx pkg --no-bytecode --public-packages "*" --public index.js --output ../../bin/$ARCH/$PROJ.exe -t $ARCH
    done

    for ARCH in $ARCHS; do
        echo "    Starting arch $ARCH"
        npx pkg --no-bytecode --public-packages "*" --public index.js --output ../../bin/$ARCH/$PROJ -t $ARCH
    done
    echo "Finished with $PROJ"
    cd ../..
done

for ARCH in "$WINARCHS"; do
    echo "Packaging $ARCH"
    cd bin/$ARCH
    zip $(printf '%s\n' "${ARCH#*-}").zip *
    mv $(printf '%s\n' "${ARCH#*-}").zip ..
    cd ../..
done

for ARCH in "$ARCHS"; do
    echo "Packaging $ARCH"
    cd bin/$ARCH
    tar -czvf $(printf '%s\n' "${ARCH#*-}").tar.gz *
    mv $(printf '%s\n' "${ARCH#*-}").tar.gz ..
    cd ../..
done
