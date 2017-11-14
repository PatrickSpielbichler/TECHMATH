#!/bin/bash
echo "Starting Google Drive upload"
./bin/gdrive upload --recursive --refresh-token $GDRIVE_REFRESH_TOKEN --parent $GDRIVE_DIR "_build/2017WS"
echo "Finished Google Drive upload"
