FROM python:3.10.8

RUN cd /tmp && \
    curl 'https://assets.hikvision.com/prd/public/all/files/202306/EN-HCNetSDKV6.1.9.48_build20230410_linux64.zip' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:131.0) Gecko/20100101 Firefox/131.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/png,image/svg+xml,*/*;q=0.8' -H 'Accept-Language: en-GB,nl-BE;q=0.5' -H 'Accept-Encoding: gzip, deflate, br, zstd' -H 'Referer: https://www.hikvision.com/' -H 'DNT: 1' -H 'Connection: keep-alive' -H 'Cookie: NewsLetterUrl=https://www.hikvision.com/mena-en/support/download/sdk/device-network-sdk--for-linux-64-bit-/; contactUsUrl=https://www.hikvision.com/mena-en/support/download/sdk/device-network-sdk--for-linux-64-bit-/' -H 'Upgrade-Insecure-Requests: 1' -H 'Sec-Fetch-Dest: iframe' -H 'Sec-Fetch-Mode: navigate' -H 'Sec-Fetch-Site: same-site' -H 'Priority: u=4' > sdk.zip && \
    unzip sdk.zip && mkdir -p /opt/hik/libs && \
    cp -a /tmp/EN-HCNetSDKV6.1.9.48_build20230410_linux64/lib/* /opt/hik/libs/
COPY hcnetsdk.py /opt/hik
COPY hikcli.py /opt/hik

ENTRYPOINT ["/usr/bin/python3", "/opt/hik/hikcli.py"]
