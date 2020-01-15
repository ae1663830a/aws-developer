#!/bin/bash

aws ssm get-parameters-by-path --path /core/dev --with-decryption
