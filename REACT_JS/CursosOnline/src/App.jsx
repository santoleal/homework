import { useState } from "react";
import "./App.css";
import ItemListContainer from "./components/pages/ItemListContainer/ItemListContainer";
import Contador from "./components/common/contador/Contador";
import NavBar from "./components/layout/navbar/NavBar";

function App() {

  let nombre = "Amig@";

  return (
    <>
      <NavBar />
      <ItemListContainer visitante={nombre} />
      <Contador />
    </>
  );
}

export default App;
