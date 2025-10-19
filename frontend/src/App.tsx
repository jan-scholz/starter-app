import './App.css'
import { Counter } from './components/Counter/Counter'
import { BackendMessage } from './components/BackendMessage/BackendMessage'
import { Logos } from './components/Logos/Logos'

function App() {

  return (
    <>
      <Logos />
      <h1>Vite + React</h1>
      <Counter />
      <BackendMessage />
    </>
  )
}

export default App
