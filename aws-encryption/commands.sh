#!/bin/bash

# Gets KMS key's ARN (can be used only customer-managed-keys, as aws-managed-keys cannot be accessed)
KMS_KEY=$(aws kms list-keys | jq '.Keys[0].KeyArn' | tr -d '"')
PROJECT_PATH=$HOME/IdeaProjects/aws-developer/aws-encryption

# Cleanup before running
rm "$PROJECT_PATH"/metadata/* 2>/dev/null
rm "$PROJECT_PATH"/decrypted/* 2>/dev/null
rm "$PROJECT_PATH"/encrypted/* 2>/dev/null

# File encryption
aws-encryption-cli --encrypt \
                   --input "$PROJECT_PATH/fileToEncrypt.txt" \
                   --master-keys key="$KMS_KEY" \
                   --metadata-output "$PROJECT_PATH/metadata/encryption-metadata.json" \
                   --output "$PROJECT_PATH/encrypted"

# File decryption
aws-encryption-cli --decrypt \
                   --input "$PROJECT_PATH/encrypted/fileToEncrypt.txt.encrypted" \
                   --metadata-output "$PROJECT_PATH/metadata/decryption-metadata.json" \
                   --output "$PROJECT_PATH/decrypted"