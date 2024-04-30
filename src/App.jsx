import React from "react"
import {BrowserRouter,Routes,Route} from "react-router-dom"
import Portfolio from "./components/portfolio"
function App() {
  return (
    <BrowserRouter>
    <Routes>
       <Route path="/" element={<Portfolio/>}></Route>
    </Routes>
</BrowserRouter>
  )
}

export default App
