# Artsy Cloudflare Error Pages

Custom Artsy-branded error pages for Cloudflare 500 and 1000 class errors:

- [**500 Error page**](https://artsy-errors.s3.amazonaws.com/cloudflare/cloudflare-500-error.htm)
- [**1000 Error page**](https://artsy-errors.s3.amazonaws.com/cloudflare/cloudflare-1000-error.htm)
- [**S3 > artsy-errors bucket > cloudflare**](https://s3.console.aws.amazon.com/s3/buckets/artsy-errors/cloudflare)
- [**Cloudflare Custom Pages UI**](https://dash.cloudflare.com/0373426be7be649ff052277fb5377c4f/artsy.net/custom-pages)

The Cloudflare UI accepts an address for a static html page with maximum size of 1.5 MB. This size limit will count any includes of scripts and external sources loaded by these pages. It is required to include cloudflare tokens, for example: `::CLOUDFLARE_ERROR_500S_BOX::`, on the page to load error details. Any changes to these files must be manually republished to Cloudflare.

We track Cloudflare errors in [Volley](https://github.com/artsy/volley) by loading a small `cloudflareError.png` pixel in these error pages and passing on the Ray ID and Client IP to Volley where it is logged.

# Deploying changes

1. Upload the updated HTML file to [S3](https://s3.console.aws.amazon.com/s3/buckets/artsy-errors/cloudflare), and grant public read access to the file.  You can also run `./deploy.sh` to upload both `html/cloudflare-1000-error.htm` and `html/cloudflare-500-error.htm` to S3 and set permissions via the aws cli (requires IAM credentials set in your shell).

2. In [Cloudflare's Custom Pages UI](https://dash.cloudflare.com/0373426be7be649ff052277fb5377c4f/artsy.net/custom-pages), open the "edit" UI for the error page. The filename should be the same as the existing page, but if not, update the link to the error page. Use the "preview" function to ensure that Cloudflare thinks the page is valid. If the page looks as expected, click "publish".
