import "../styles/index.scss"
import axios from "axios"

console.info("Bridgetown is loaded!")

const endpoint = "/api/fun/whats-the-time"

document.querySelector("#callapi").addEventListener("click", () => {
  axios.get(endpoint, {params: {search: "Search Query…"}}).then(response => {
    // handle success
    document.querySelector("#results").textContent = response.data
  })
})

document.querySelector("#callpost").addEventListener("click", () => {
  console.info("posting!")
  const fd = new FormData()
  fd.append("input", "barz")
  axios.post(endpoint, fd).then(response => {
    console.info("response", response)
    // handle success
    const jsondata = response.data
    document.querySelector("#results").textContent = `body: ${jsondata.body}, version: ${jsondata.version}`
  })

/*  axios.patch(endpoint, {input: "JSON Works!"}).then(response => {
    console.info("response", response)
    // handle success
    const jsondata = response.data
    document.querySelector("#results").textContent = `body: ${jsondata.body}, version: ${jsondata.version}`
  }) */

/*  axios.delete(endpoint, {params: {input: "JSON Works!"}}).then(response => {
    console.info("response", response)
    // handle success
    const jsondata = response.data
    document.querySelector("#results").textContent = `body: ${jsondata.body}, version: ${jsondata.version}`
  }) */
})
