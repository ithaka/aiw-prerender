const express = require('express')

const app = express()
app.get('/', (req, res) => {
  res.status(200).send({ message: 'hello there' })
})

const PORT = process.env.PORT || '5555'

app.listen(PORT, () => {
  console.log('prerender server listening on ' + PORT)
})