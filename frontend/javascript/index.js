import "../styles/index.scss"
import axios from "axios"

console.info("Bridgetown is loaded!")

const endpoint = "/api/whats-the-time"

document.querySelector("#callapi").addEventListener("click", () => {
  axios.get(endpoint).then(response => {
    // handle success
    document.querySelector("#results").textContent = response.data
  })
})

document.querySelector("#callpost").addEventListener("click", () => {
  console.info("posting!")
  axios.post(endpoint).then(response => {
    console.info("response", response)
    // handle success
    const jsondata = response.data
    document.querySelector("#results").textContent = `body: ${jsondata.body}, version: ${jsondata.version}`
  })
})
