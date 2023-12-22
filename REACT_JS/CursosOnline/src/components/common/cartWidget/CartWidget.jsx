import React, { useState } from 'react'
import { FaCartPlus } from "react-icons/fa";

const CartWidget = () => {

const [cantidadItems, setCantidadItems] = useState(0)

    return (
    <div><FaCartPlus />
        {cantidadItems}

    </div>
  )
}

export default CartWidget