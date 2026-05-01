// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CulturaJordania
 * @dev Registro de procesos de rehidratacion coloidal y coccion lenta de proteinas.
 * Serie: Sabores de Asia (#4)
 */
contract CulturaJordania {

    struct Plato {
        string nombre;
        string ingredientes;
        string preparacion;
        uint256 concentracionJameed;  // Densidad del caldo lacteo (1-100)
        uint256 tiempoCoccionHoras;   // Tiempo de desnaturalizacion proteica
        bool usaArrozSafranado;       // Validador de base de carbohidratos
        uint256 likes;
        uint256 dislikes;
    }

    mapping(uint256 => Plato) public registroCulinario;
    uint256 public totalRegistros;
    address public owner;

    constructor() {
        owner = msg.sender;
        // Inauguramos con el Mansaf (Ingenieria del Jameed)
        registrarPlato(
            "Mansaf", 
            "Cordero, Jameed (yogur seco), arroz, pinones, pan Shrak.",
            "Rehidratacion de Jameed para crear un caldo donde se cuece el cordero hasta que la fibra se separa del hueso.",
            90, 
            4, 
            true
        );
    }

    function registrarPlato(
        string memory _nombre, 
        string memory _ingredientes,
        string memory _preparacion,
        uint256 _concentracion, 
        uint256 _tiempo,
        bool _arroz
    ) public {
        require(bytes(_nombre).length > 0, "Nombre requerido");
        totalRegistros++;
        registroCulinario[totalRegistros] = Plato({
            nombre: _nombre,
            ingredientes: _ingredientes,
            preparacion: _preparacion,
            concentracionJameed: _concentracion,
            tiempoCoccionHoras: _tiempo,
            usaArrozSafranado: _arroz,
            likes: 0,
            dislikes: 0
        });
    }

    function darLike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].likes++;
    }

    function darDislike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].dislikes++;
    }
}
