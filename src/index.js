const express = require('express')
const prerender = require('prerender')

const app = prerender({
  logRequests: true,
  chromeFlags: ['--no-sandbox', '--headless', '--disable-gpu', '--remote-debugging-port=9222', '--hide-scrollbars']
})
app.start()