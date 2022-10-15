// axios
import axios from 'axios'

// const baseURL = 'http://miprinters.com/proyects/LUMEN/amosis-api/public/api/amosis/'
const baseURL = import.meta.env.VITE_HOST+'/'

export default axios.create({
    baseURL,
    // headers: {

    "Access-Control-Allow-Origin": "*",
"Access-Control-Allow-Methods": "POST, GET, OPTIONS",
"Access-Control-Allow-Headers": "Authorization, Content-Type",
"Content-Type": "application/json"
    // headers: {
    // "Access-Control-Allow-Origin": "*",
    // 'X-Requested-With': 'XMLHttpRequest'
    // }
  // You can add your headers here
})