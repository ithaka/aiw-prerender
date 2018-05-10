const express = require('express')
const prerender = require('prerender')

const app = prerender({
  logRequests: true,
  chromeFlags: ['--no-sandbox', '--headless', '--disable-gpu', '--remote-debugging-port=9222', '--hide-scrollbars']
})
app.start()

// const app = express()
// app.get('/', (req, res) => {
//   res.status(200).send({ message: 'hello there' })
// })

// app.get('/healthcheck', (req, res) => {
//     res.status(200).send({ message: 'hello there' })
// });

// const PORT = process.env.PORT || '3000'

// app.listen(PORT, () => {
//   console.log('prerender server listening on ' + PORT)
// })