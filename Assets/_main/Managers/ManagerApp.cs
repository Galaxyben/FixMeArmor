using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Mangos
{
	public class ManagerApp : MonoBehaviour {

		//En algun momento me tenfgo que asegurar de que el estado cambie conforme al estado del juego

		void Awake()
		{
			ManagerStatic.appManager = this;
		}
	}
}
