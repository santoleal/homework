import React from 'react'
import CartWidget from '../../common/cartWidget/CartWidget';
import './NavBar.css'


const NavBar = () => {

const paginas = [
    "Inicio", 
    "Cursos",
    "Estudiantes",
    "Contacto",
    ];


  return (
      <>
        
        <nav className="navbar">
          <ul>
            <li>{paginas[0]}</li>
            <li>{paginas[1]}</li>
            <li>{paginas[2]}</li>
            <li>{paginas[3]}</li>
          </ul>
          <CartWidget/>
        </nav>

      </>

    
  )
}

export default NavBar