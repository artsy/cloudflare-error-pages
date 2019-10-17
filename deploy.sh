#! /bin/sh

set -e

aws s3 cp ./html/cloudflare-500-error.htm s3://artsy-errors/cloudflare/cloudflare-500-error.htm
aws s3api put-object-acl --bucket artsy-errors --key cloudflare/cloudflare-500-error.htm --acl public-read

aws s3 cp ./html/cloudflare-1000-error.htm s3://artsy-errors/cloudflare/cloudflare-1000-error.htm
aws s3api put-object-acl --bucket artsy-errors --key cloudflare/cloudflare-1000-error.htm --acl public-read
