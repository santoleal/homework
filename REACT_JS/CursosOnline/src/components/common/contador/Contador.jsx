import React, { useState } from 'react'

const Contador = () => {

const [contador, setContador] = useState(0);

const sumar = () => {
    setContador(contador + 1)
}

const restar = () => {
  setContador(contador -1)
}

  return (
    <>
    <h2>Contador</h2>
    <h4>Número: {contador}</h4>
    <button onClick={sumar}>Agregar</button>
    <button onClick={restar}>Sacar</button>


    </>
  )
}

export default Contador