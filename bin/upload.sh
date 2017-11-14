#!/bin/bash
echo "Starting Google Drive upload"
./bin/gdrive sync upload --refresh-token $GDRIVE_REFRESH_TOKEN _build $GDRIVE_DIR
echo "Finished Google Drive upload"
