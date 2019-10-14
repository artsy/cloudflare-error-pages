# Artsy Cloudflare Error Pages

Custom Artsy-branded error pages for Cloudflare 500 and 1000 class errors:

- [**500 Error page**](https://artsy-errors.s3.amazonaws.com/cloudflare/cloudflare-500-error.htm)
- [**1000 Error page**](https://artsy-errors.s3.amazonaws.com/cloudflare/cloudflare-1000-error.htm)
- [**S3 > artsy-errors bucket > cloudflare**](https://s3.console.aws.amazon.com/s3/buckets/artsy-errors/cloudflare)
- [**Cloudflare Custom Pages UI**](https://dash.cloudflare.com/0373426be7be649ff052277fb5377c4f/artsy.net/custom-pages)

The Cloudflare UI accepts an address for a static html page with maximum size of 1.5 MB. This size limit will count any includes of scripts and external sources loaded by these pages. It is required to include cloudflare tokens, for example: `::CLOUDFLARE_ERROR_500S_BOX::`, on the page to load error details. Any changes to these files must be manually republished to Cloudflare.

# Deploying changes

1. In [S3](https://s3.console.aws.amazon.com/s3/buckets/artsy-errors/cloudflare), delete the existing file for the error page you are changing. This page is only accessed when the file is saved to by Cloudflare, so there is no risk of downtime.

2. Upload the updated HTML file to [S3](https://s3.console.aws.amazon.com/s3/buckets/artsy-errors/cloudflare), and grant public read access to the file.

3. In [Cloudflare's Custom Pages UI](https://dash.cloudflare.com/0373426be7be649ff052277fb5377c4f/artsy.net/custom-pages), open the "edit" UI for the error page. The filename should be the same as the existing page, but if not, update the link to the error page. Use the "preview" function to ensure that Cloudflare thinks the page is valid. If the page looks as expected, click "publish".
