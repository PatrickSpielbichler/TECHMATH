#!/bin/sh
echo "Starting Google Drive upload"
./bin/gdrive upload --recursive --refresh-token $GDRIVE_REFRESH_TOKEN --parent $GDRIVE_DIR "build_/2017WS/"
echo "Finished Google Drive upload"
