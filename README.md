# cowrie-rakefile
a rakefile that makes it easy to parse cowrie logs.


# Top
Returns the top ten
### Top TCP IP
`rake top:tcpip`

### Success IP
`rake top:sip`

### Failed IP
`rake top:fip`

### Top Pass
`rake top:pass`

### Top User
`rake top:user`

### Top commands
`rake top:commands`

# Commands

### Exports all the commands into out_commands.txt
`rake commands:export`


# Download

`rake download:all`

### Top 10 Downloads
`rake download:top`

### Top 10 URLS
`rake download:urls`

### All URLS
`rake download:allurls`


# Pass

### All Pass
`rake pass:all`

### Export pass to out_pass.txt
`rake pass:export`

