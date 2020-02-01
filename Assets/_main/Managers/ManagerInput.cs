using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;


namespace Mangos
{
	public class ManagerInput : MonoBehaviour {


		void Awake()
		{
            //SE OCUOPA DECIRLEA AL MANAGER STATIC QUIEN ES SI MANAGER DE INPUTS
			ManagerStatic.inputManager = this;

            
		}

		void Update()
  	{
            //CODIGO DE LOS INPUTS DEPENDIENDO DEL ESTADO DEL JUEGO

            
        }
    }
}
