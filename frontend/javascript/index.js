import "../styles/index.scss"
import axios from "axios"

console.info("Bridgetown is loaded!")

const endpoint = "/api/whats-the-time"

document.querySelector("#callapi").addEventListener("click", () => {
  axios.get(endpoint).then(response => {
    // handle success
    alert(response.data)
  })
})
