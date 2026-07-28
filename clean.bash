#!/bin/bash

# ==========================================
FOLDER_NAME=".antlr"
# ==========================================

TARGET_DIR="$FOLDER_NAME"

if [ -z "$FOLDER_NAME" ]; then
    echo "Error: Folder name is empty! Exiting to prevent system damage."
    exit 1
fi

if [ ! -d "$TARGET_DIR" ]; then
    echo "Directory $TARGET_DIR does not exist. Creating it..."
    mkdir -p "$TARGET_DIR"
    echo "Folder created successfully. Exiting script as requested."
    exit 0
fi

echo "Directory $TARGET_DIR already exists. Cleaning all contents..."
rm -rf "${TARGET_DIR:?}/"*
echo "----------------------------------------"
echo "Done!"
echo "Contents of $TARGET_DIR are deleted."
